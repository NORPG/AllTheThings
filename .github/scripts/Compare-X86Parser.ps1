param(
    [Parameter(Mandatory)][string]$Flavor,
    [Parameter(Mandatory)][string]$OutputName,
    [string]$Config = ''
)
$ErrorActionPreference = 'Stop'
$evidence = Join-Path $env:RUNNER_TEMP "x86-parser-evidence-$Flavor"
$work = Join-Path $env:RUNNER_TEMP "x86-parser-work-$Flavor"
New-Item -ItemType Directory -Path $evidence, $work -Force | Out-Null
$result = [ordered]@{ flavor = $Flavor; commit = $env:GITHUB_SHA; runs = @{}; passed = $false; error = $null }
function Copy-Tree([string]$Source, [string]$Destination) {
    New-Item -ItemType Directory -Path $Destination -Force | Out-Null
    & robocopy $Source $Destination /E /R:1 /W:1 /NFL /NDL /NJH /NJS /NP | Out-Null
    if ($LASTEXITCODE -gt 7) { throw "Copy failed ($LASTEXITCODE): $Source" }
}
function Get-Manifest([string]$Directory) {
    $prefix = [IO.Path]::GetFullPath($Directory).TrimEnd('\')
    @(Get-ChildItem -LiteralPath $prefix -File -Recurse -Force | Sort-Object FullName | ForEach-Object {
        '{0}  {1}' -f (Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash.ToLowerInvariant(), $_.FullName.Substring($prefix.Length + 1).Replace('\', '/')
    })
}
function Build-Parser([string]$Platform) {
    $source = Join-Path $work "build-$Platform/src"
    $output = Join-Path $work "build-$Platform/output"
    Copy-Tree (Join-Path $env:GITHUB_WORKSPACE '.contrib/src') $source
    New-Item -ItemType Directory -Path $output -Force | Out-Null
    $out = $output.Replace('\','/') + '/'
    $arguments = @((Join-Path $source 'Parser/Parser.csproj'), '-restore', '-t:Rebuild', '-p:Configuration=Release', "-p:Platform=$Platform", "-p:OutDir=$out", "-p:OutputPath=$out", '-nologo')
    & msbuild @arguments *> (Join-Path $evidence "$Platform.build.log")
    if ($LASTEXITCODE -ne 0) { throw "Parser $Platform build failed: $LASTEXITCODE" }
    foreach ($file in 'Parser.exe', 'Parser.exe.config', 'Csv.dll', 'NLua.dll', 'KeraLua.dll', 'lua54.dll') {
        if (-not (Test-Path -LiteralPath (Join-Path $output $file) -PathType Leaf)) { throw "Parser $Platform missing $file" }
    }
    return $output
}
function Invoke-Parser([string]$Platform, [string]$RunRoot) {
    $tools = Join-Path $RunRoot '.contrib/.tools'
    $stdout = Join-Path $evidence "$Platform.stdout.log"
    $stderr = Join-Path $evidence "$Platform.stderr.log"
    $arguments = 'auto baseconfig="../.db/standard/.config/retail/retail.config"'
    if ($Config) { $arguments += ' config="' + $Config + '"' }
    $run = [ordered]@{ startedUtc = [DateTime]::UtcNow.ToString('o'); exitCode = $null; timedOut = $false; errors = @() }
    $result.runs[$Platform] = $run
    $process = Start-Process -FilePath (Join-Path $tools 'Parser.exe') -ArgumentList $arguments -WorkingDirectory $tools -RedirectStandardOutput $stdout -RedirectStandardError $stderr -PassThru -WindowStyle Hidden
    $processHandle = $process.Handle
    if (-not $process.WaitForExit(420000)) {
        $run.timedOut = $true
        $process.Kill()
        $process.WaitForExit()
        $run.errors += 'Timed out after 420 seconds'
    }
    $process.WaitForExit()
    $run.exitCode = $process.ExitCode
    if ($null -eq $run.exitCode -or $run.exitCode -ne 0) { $run.errors += "Exit code: $($run.exitCode)" }
    if ((Get-Item -LiteralPath $stderr).Length -ne 0) { $run.errors += 'Standard error is not empty' }
    $log = [IO.File]::ReadAllText($stdout)
    if ($log -notmatch '(?m)^\d+ ExportAddonData\.\.\.\r?$') { $run.errors += 'Missing ExportAddonData marker' }
    if ($log -notmatch '(?m)^\d+ FinalLogging\.\.\.\r?$') { $run.errors += 'Missing FinalLogging marker' }
    if ($log -match '(?m)^(ERROR:|==== EXCEPTION ====|-- (Errors encountered|Exception encountered))') { $run.errors += 'Parser logged an error' }
    if (Test-Path -LiteralPath (Join-Path $tools 'ATT-ERROR-FILE.txt')) { $run.errors += 'ATT-ERROR-FILE.txt exists' }
    $output = Join-Path $RunRoot "db/$OutputName"
    foreach ($file in 'LocalizationDB.lua', 'ReferenceDB.lua', 'Database.xml') {
        $path = Join-Path $output $file
        if (-not (Test-Path -LiteralPath $path -PathType Leaf) -or (Get-Item -LiteralPath $path).Length -eq 0) { $run.errors += "Missing or empty $file" }
    }
    $run.finishedUtc = [DateTime]::UtcNow.ToString('o')
    if ($run.errors.Count) { throw "$Platform Parser run failed: $($run.errors -join '; ')" }
}
try {
    $sourceDb = Join-Path $env:GITHUB_WORKSPACE '.contrib/.db'
    $configFiles = @((Join-Path $sourceDb 'shared/.config/root.config'), (Join-Path $sourceDb 'standard/.config/retail/retail.config'))
    if ($Config) { $configFiles += Join-Path (Join-Path $env:GITHUB_WORKSPACE '.contrib/.tools') $Config }
    $values = @{}
    foreach ($file in $configFiles) {
        $text = Get-Content -LiteralPath $file -Raw
        foreach ($key in 'IgnoreWowheadRetrieval', 'DoConsolidateObjectDB') {
            foreach ($match in [regex]::Matches($text, '"' + $key + '"\s*:\s*(true|false)', 'IgnoreCase')) { $values[$key] = $match.Groups[1].Value.ToLowerInvariant() }
        }
    }
    if ($values['IgnoreWowheadRetrieval'] -ne 'true' -or $values['DoConsolidateObjectDB'] -ne 'false') { throw 'Parser offline settings differ' }
    $result['offlineSettings'] = $values
    $inputManifest = @(Get-Manifest $sourceDb)
    $result['inputFileCount'] = $inputManifest.Count
    if ($inputManifest.Count -eq 0) { throw 'Source database is empty' }
    foreach ($platform in 'x64', 'x86') {
        $package = Build-Parser $platform
        $runRoot = Join-Path $work "run-$platform"
        $db = Join-Path $runRoot '.contrib/.db'
        $tools = Join-Path $runRoot '.contrib/.tools'
        Copy-Tree $sourceDb $db
        Copy-Tree $package $tools
        if (Compare-Object $inputManifest @(Get-Manifest $db)) { throw "$platform input snapshot differs from checkout" }
    }
    foreach ($platform in 'x64', 'x86') { Invoke-Parser $platform (Join-Path $work "run-$platform") }
    $headers = @{}
    $postDbManifests = @{}
    foreach ($platform in 'x64', 'x86') {
        $runRoot = Join-Path $work "run-$platform"
        $header = Join-Path $runRoot '.contrib/.db/shared/constants/headerIDs.lua'
        if (-not (Test-Path -LiteralPath $header -PathType Leaf)) { throw "Missing headerIDs.lua: $platform" }
        $headers[$platform] = (Get-FileHash -LiteralPath $header -Algorithm SHA256).Hash.ToLowerInvariant()
        $exportRoot = Join-Path $runRoot 'db'
        $manifest = @(Get-Manifest $exportRoot)
        $exportFiles = @(Get-ChildItem -LiteralPath $exportRoot -File -Recurse -Force)
        $result.runs[$platform]['outputFileCount'] = $exportFiles.Count
        $result.runs[$platform]['outputBytes'] = [long](($exportFiles | Measure-Object -Property Length -Sum).Sum)
        $postDbManifests[$platform] = @(Get-Manifest (Join-Path $runRoot '.contrib/.db'))
        if ($manifest.Count -eq 0) { throw "No exports: $platform" }
        [IO.File]::WriteAllLines((Join-Path $evidence "$platform.exports.log"), $manifest, [Text.UTF8Encoding]::new($false))
    }
    $result['headerIDs'] = $headers
    if ($headers.x64 -ne $headers.x86) { throw 'headerIDs.lua differs' }
    if (Compare-Object $postDbManifests.x64 $postDbManifests.x86) { throw 'Post-run source database manifests differ' }
    $result['postRunSourceEqual'] = $true
    $differences = @(Compare-Object (Get-Content (Join-Path $evidence 'x64.exports.log')) (Get-Content (Join-Path $evidence 'x86.exports.log')))
    if ($differences.Count) {
        $differences | Out-String | Set-Content -LiteralPath (Join-Path $evidence 'differences.log')
        throw "Export manifests differ: $($differences.Count) entries"
    }
    $result.passed = $true
} catch {
    $result.error = $_.Exception.ToString()
    throw
} finally {
    [IO.File]::WriteAllText((Join-Path $evidence 'result.json'), ($result | ConvertTo-Json -Depth 10), [Text.UTF8Encoding]::new($false))
    Write-Host ('X86_PARSER_RESULT=' + (ConvertTo-Json -InputObject $result -Depth 10 -Compress))
}

exit 0
