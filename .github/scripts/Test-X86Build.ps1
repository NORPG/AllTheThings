$ErrorActionPreference = 'Stop'
$evidence = Join-Path $env:RUNNER_TEMP 'x86-build-evidence'
$work = Join-Path $env:RUNNER_TEMP 'x86-build-work'
New-Item -ItemType Directory -Path $evidence, $work -Force | Out-Null
$result = [ordered]@{ commit = $env:GITHUB_SHA; builds = @(); passed = $false; error = $null }
function Get-Pe([string]$Path) {
    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) { throw "Missing binary: $Path" }
    $stream = [IO.File]::OpenRead($Path)
    try {
        $reader = [System.Reflection.PortableExecutable.PEReader]::new($stream)
        try {
            $headers = $reader.PEHeaders
            $flags = if ($null -eq $headers.CorHeader) { $null } else { [int]$headers.CorHeader.Flags }
            return @{ machine = $headers.CoffHeader.Machine.ToString(); corFlags = $flags; sha256 = (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant() }
        } finally { $reader.Dispose() }
    } finally { $stream.Dispose() }
}
function Assert-Managed([string]$Path, [string]$Platform) {
    $pe = Get-Pe $Path
    $machine = if ($Platform -eq 'x64') { 'Amd64' } else { 'I386' }
    if ($pe.machine -ne $machine -or $null -eq $pe.corFlags -or ($pe.corFlags -band 1) -eq 0) { throw "Wrong managed PE: $Path" }
    if ($Platform -eq 'x86' -and ($pe.corFlags -band 2) -eq 0) { throw "32BITREQUIRED missing: $Path" }
    if ($Platform -eq 'AnyCPU' -and ($pe.corFlags -band 2) -ne 0) { throw "Unexpected 32BITREQUIRED: $Path" }
    return $pe
}
function Assert-Native([string]$Path, [string]$Platform) {
    $pe = Get-Pe $Path
    $machine = if ($Platform -eq 'x86') { 'I386' } else { 'Amd64' }
    if ($pe.machine -ne $machine -or $null -ne $pe.corFlags) { throw "Wrong native PE: $Path" }
    return $pe
}
function Build-Solution([string]$Solution, [string]$Config, [string]$Platform, [string]$Label) {
    $source = Join-Path $work "$Label/src"
    $output = Join-Path $work "$Label/output"
    New-Item -ItemType Directory -Path $source, $output -Force | Out-Null
    & robocopy (Join-Path $env:GITHUB_WORKSPACE '.contrib/src') $source /E /R:1 /W:1 /NFL /NDL /NJH /NJS /NP | Out-Null
    if ($LASTEXITCODE -gt 7) { throw "Source copy failed: $Label ($LASTEXITCODE)" }
    $out = $output.Replace('\','/') + '/'
    $solutionPlatform = if ($Platform -eq 'AnyCPU') { 'Any CPU' } else { $Platform }
    $arguments = @((Join-Path $source $Solution), '-restore', '-t:Rebuild', "-p:Configuration=$Config", "-p:Platform=$solutionPlatform", "-p:OutDir=$out", "-p:OutputPath=$out", '-nologo')
    & msbuild @arguments *> (Join-Path $evidence "$Label.build.log")
    if ($LASTEXITCODE -ne 0) { throw "$Label build failed: $LASTEXITCODE" }
    return $output
}
try {
    Add-Type -AssemblyName System.Reflection.Metadata
    $release = @{}
    foreach ($platform in 'x64', 'x86') {
        foreach ($config in 'Debug', 'Release') {
            $label = "parser-$platform-$config"
            $out = Build-Solution 'Parser/Parser.sln' $config $platform $label
            $files = @{}
            $files['Parser.exe'] = Assert-Managed (Join-Path $out 'Parser.exe') $platform
            $files['lua54.dll'] = Assert-Native (Join-Path $out 'lua54.dll') $platform
            $files['CSVCleaner.exe'] = Assert-Native (Join-Path $out 'CSVCleaner.exe') $platform
            $files['CSVCleaner.dll'] = Assert-Managed (Join-Path $out 'CSVCleaner.dll') $platform
            foreach ($name in 'Csv.dll', 'KeraLua.dll', 'NLua.dll', 'Parser.exe.config', 'CSVCleaner.deps.json', 'CSVCleaner.runtimeconfig.json') {
                if (-not (Test-Path -LiteralPath (Join-Path $out $name) -PathType Leaf)) { throw "$label missing $name" }
            }
            $result.builds += @{ label = $label; files = $files }
            if ($config -eq 'Release') { $release["Parser-$platform"] = $out }
        }
    }
    foreach ($platform in 'x64', 'x86') {
        foreach ($config in 'Debug', 'Release', 'Test') {
            $label = "harvester-$platform-$config"
            $out = Build-Solution 'Blizzard API Harvester/Blizzard API Harvester.sln' $config $platform $label
            $files = @{}
            foreach ($name in 'Blizzard API Harvester.exe', 'Classic Item Detector.exe', 'Item DB Compare Tool.exe') {
                $files[$name] = Assert-Managed (Join-Path $out $name) $platform
            }
            $result.builds += @{ label = $label; files = $files }
            if ($config -eq 'Release') { $release["Harvester-$platform"] = $out }
        }
    }
    . (Join-Path $env:GITHUB_WORKSPACE '.github/scripts/Test-X86Fixtures.ps1')
    $result['fixtures'] = @()
    $result.fixtures += Invoke-ToolFixtures -ParserRelease $release['Parser-x64'] -HarvesterRelease $release['Harvester-x64'] -Arch 'baseline' -Evidence $evidence
    $result.fixtures += Invoke-ToolFixtures -ParserRelease $release['Parser-x86'] -HarvesterRelease $release['Harvester-x86'] -Arch 'x86' -Evidence $evidence
    $result.passed = $true
} catch {
    $result.error = $_.Exception.ToString()
    throw
} finally {
    [IO.File]::WriteAllText((Join-Path $evidence 'result.json'), ($result | ConvertTo-Json -Depth 10), [Text.UTF8Encoding]::new($false))
    Write-Host ('X86_BUILD_RESULT=' + (ConvertTo-Json -InputObject $result -Depth 10 -Compress))
}

exit 0
