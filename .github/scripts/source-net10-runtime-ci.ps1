param(
    [Parameter(Mandatory = $true)][string] $Release,
    [Parameter(Mandatory = $true)][string] $FixtureRoot,
    [Parameter(Mandatory = $true)][string] $Evidence,
    [string] $SharedTools
)
$ErrorActionPreference = 'Stop'
New-Item -ItemType Directory -Force $FixtureRoot, $Evidence | Out-Null

function Invoke-FixtureProcess {
    param(
        [string] $FileName,
        [string[]] $Arguments,
        [string] $WorkingDirectory,
        [string] $Label,
        [int] $TimeoutSeconds = 60,
        [hashtable] $Environment = @{}
    )
    $info = [System.Diagnostics.ProcessStartInfo]::new()
    $info.FileName = $FileName
    $info.WorkingDirectory = $WorkingDirectory
    $info.UseShellExecute = $false
    $info.RedirectStandardInput = $true
    $info.RedirectStandardOutput = $true
    $info.RedirectStandardError = $true
    foreach ($argument in $Arguments) { [void] $info.ArgumentList.Add($argument) }
    foreach ($key in $Environment.Keys) { $info.Environment[$key] = $Environment[$key] }
    $process = [System.Diagnostics.Process]::new()
    $process.StartInfo = $info
    if (!$process.Start()) { throw "Could not start $Label" }
    $process.StandardInput.Close()
    $stdout = $process.StandardOutput.ReadToEndAsync()
    $stderr = $process.StandardError.ReadToEndAsync()
    $timedOut = !$process.WaitForExit($TimeoutSeconds * 1000)
    if ($timedOut) { $process.Kill($true); $process.WaitForExit() }
    $outputText = $stdout.GetAwaiter().GetResult()
    $errorText = $stderr.GetAwaiter().GetResult()
    [System.IO.File]::WriteAllText((Join-Path $Evidence "$Label.stdout.txt"), $outputText)
    [System.IO.File]::WriteAllText((Join-Path $Evidence "$Label.stderr.txt"), $errorText)
    [pscustomobject]@{
        executable = $FileName; arguments = @($Arguments); workingDirectory = $WorkingDirectory
        exitCode = $process.ExitCode; timedOut = $timedOut; timeoutSeconds = $TimeoutSeconds
    } | ConvertTo-Json -Depth 5 | Set-Content -Encoding utf8 (Join-Path $Evidence "$Label.process.json")
    if ($timedOut -or $process.ExitCode -ne 0) { throw "$Label failed or timed out (exit $($process.ExitCode)); see $Evidence" }
}

function Assert-Text([string] $Path, [string] $Expected, [string] $Label) {
    if (!(Test-Path -LiteralPath $Path -PathType Leaf)) { throw "$Label output missing: $Path" }
    $actual = [System.IO.File]::ReadAllText($Path).Replace("`r`n", "`n")
    $expectedText = $Expected.Replace("`r`n", "`n")
    [System.IO.File]::WriteAllText((Join-Path $Evidence "$Label.expected.txt"), $expectedText)
    [System.IO.File]::WriteAllText((Join-Path $Evidence "$Label.actual.txt"), $actual)
    if ($actual -cne $expectedText) { throw "$Label output did not match fixture expectation" }
}

# AssetDB: execute the actual tool against a synthetic input in a separate repository-shaped tree.
$assetRepo = Join-Path $FixtureRoot 'asset-repo'
$assetWork = Join-Path $assetRepo '.contrib/.tools'
if ($SharedTools) {
    if (!(Test-Path -LiteralPath $SharedTools -PathType Container)) { throw "Shared tools folder missing: $SharedTools" }
    $assetWork = $SharedTools
    $assetRepo = [System.IO.Directory]::GetParent([System.IO.Directory]::GetParent($SharedTools).FullName).FullName
}
$assetInput = Join-Path $assetRepo '.contrib/.raw/AssetDB'
New-Item -ItemType Directory -Force $assetWork, $assetInput | Out-Null
[System.IO.File]::WriteAllText((Join-Path $assetInput 'fixture.json'), '{"20":false,"3":{"x":1}}')
$assetExe = if ($SharedTools) { Join-Path $SharedTools 'AssetDB Builder.exe' } else { Join-Path $Release 'AssetDB Builder/AssetDB Builder.exe' }
Invoke-FixtureProcess $assetExe @() $assetWork 'asset-exe'
$assetExpected = "-- #if fixture`n_.AssetDB = {`n[3]=1,`n[20]=1,`n};`n-- #endif`n"
Assert-Text (Join-Path $assetRepo '.contrib/.db/standard/00 - DB/AssetDB/fixture.lua') $assetExpected 'asset-output'

# IconID: provide a local listfile to avoid downloads, then check both replacement and a non-match.
$iconRepo = Join-Path $FixtureRoot 'icon-repo'
$iconWork = Join-Path $iconRepo '.contrib/.tools'
if ($SharedTools) { $iconRepo = $assetRepo; $iconWork = $SharedTools }
$iconData = Join-Path $iconWork 'Wago'
$iconSource = Join-Path $iconRepo 'src'
New-Item -ItemType Directory -Force $iconData, $iconSource | Out-Null
[System.IO.File]::WriteAllText((Join-Path $iconData 'community-listfile.csv'), "12345;Interface/Icons/inv_test.blp`n")
$iconFile = Join-Path $iconSource 'fixture.lua'
[System.IO.File]::WriteAllText($iconFile, "local icon = `"Interface/Icons/inv_test`"`nlocal untouched = `"Interface/Icons/missing`"`n")
$iconExe = if ($SharedTools) { Join-Path $SharedTools 'IconID Converter.exe' } else { Join-Path $Release 'IconID Converter/IconID Converter.exe' }
Invoke-FixtureProcess $iconExe @() $iconWork 'icon-exe'
Assert-Text $iconFile "local icon = 12345`nlocal untouched = `"Interface/Icons/missing`"`n" 'icon-output'
