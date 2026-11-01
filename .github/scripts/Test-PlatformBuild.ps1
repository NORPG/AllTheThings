param([Parameter(Mandatory)][ValidateSet('X64','Arm64')][string]$HostArchitecture)
$ErrorActionPreference = 'Stop'
$evidence = Join-Path $env:RUNNER_TEMP "platform-build-evidence-$HostArchitecture"
$work = Join-Path $env:RUNNER_TEMP "platform-build-work-$HostArchitecture"
New-Item -ItemType Directory -Path $evidence, $work -Force | Out-Null
$result = [ordered]@{
    commit = $env:GITHUB_SHA
    host = @{ os = [Runtime.InteropServices.RuntimeInformation]::OSArchitecture.ToString(); process = [Runtime.InteropServices.RuntimeInformation]::ProcessArchitecture.ToString(); msbuild = $env:VERIFIED_MSBUILD_ARCH; dotnet = $env:VERIFIED_DOTNET_HOST }
    builds = @(); fixtures = @(); passed = $false; error = $null
}
function Get-Pe([string]$Path) {
    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) { throw "Missing binary: $Path" }
    $stream = [IO.File]::OpenRead($Path)
    try {
        $reader = [System.Reflection.PortableExecutable.PEReader]::new($stream)
        try {
            $headers = $reader.PEHeaders
            $flags = if ($null -eq $headers.CorHeader) { $null } else { [int]$headers.CorHeader.Flags }
            $characteristics = [int]$headers.CoffHeader.Characteristics
            return @{ machine = $headers.CoffHeader.Machine.ToString(); corFlags = $flags; characteristics = $characteristics; largeAddressAware = (($characteristics -band 0x20) -ne 0); sha256 = (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant() }
        } finally { $reader.Dispose() }
    } finally { $stream.Dispose() }
}
function Get-Machine([string]$Platform) {
    switch ($Platform) { 'x64' { 'Amd64' } 'ARM64' { 'Arm64' } default { 'I386' } }
}
function Assert-Managed([string]$Path, [string]$Platform) {
    $pe = Get-Pe $Path
    if ($pe.machine -ne (Get-Machine $Platform) -or $null -eq $pe.corFlags -or ($pe.corFlags -band 1) -eq 0) { throw "Wrong managed PE: $Path" }
    if ($Platform -eq 'x86' -and ($pe.corFlags -band 2) -eq 0) { throw "32BITREQUIRED missing: $Path" }
    if ($Platform -eq 'AnyCPU' -and ($pe.corFlags -band 0x20002) -ne 0) { throw "Unexpected 32-bit required or preferred flag: $Path" }
    return $pe
}
function Assert-Native([string]$Path, [string]$Platform) {
    $pe = Get-Pe $Path
    if ($pe.machine -ne (Get-Machine $Platform) -or $null -ne $pe.corFlags) { throw "Wrong native PE: $Path" }
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
    if ($result.host.os -ne $HostArchitecture -or $result.host.process -ne $HostArchitecture -or $result.host.msbuild -ne $HostArchitecture) { throw 'Native host architecture checks did not pass' }
    $platforms = if ($HostArchitecture -eq 'X64') { @('x64', 'x86', 'AnyCPU') } else { @('ARM64', 'AnyCPU') }
    $release = @{}
    $laaErrors = @()
    foreach ($platform in $platforms) {
        foreach ($config in 'Debug', 'Release') {
            $label = "parser-$platform-$config"
            $out = Build-Solution 'Parser/Parser.sln' $config $platform $label
            $files = @{}
            $files['Parser.exe'] = Assert-Managed (Join-Path $out 'Parser.exe') $platform
            if ($platform -eq 'AnyCPU') {
                foreach ($native in 'x86', 'x64', 'ARM64') { $files["$native/lua54.dll"] = Assert-Native (Join-Path $out "$native/lua54.dll") $native }
                if (Test-Path -LiteralPath (Join-Path $out 'CSVCleaner.exe')) { throw 'AnyCPU CSVCleaner unexpectedly has an apphost' }
            } else {
                $files['lua54.dll'] = Assert-Native (Join-Path $out 'lua54.dll') $platform
                $files['CSVCleaner.exe'] = Assert-Native (Join-Path $out 'CSVCleaner.exe') $platform
            }
            $files['CSVCleaner.dll'] = Assert-Managed (Join-Path $out 'CSVCleaner.dll') $platform
            foreach ($name in 'Csv.dll', 'KeraLua.dll', 'NLua.dll', 'Parser.exe.config', 'CSVCleaner.deps.json', 'CSVCleaner.runtimeconfig.json') {
                if (-not (Test-Path -LiteralPath (Join-Path $out $name) -PathType Leaf)) { throw "$label missing $name" }
            }
            $result.builds += @{ label = $label; files = $files }
            if ($platform -eq 'x86' -or $platform -eq 'x64') {
                foreach ($name in 'Parser.exe', 'CSVCleaner.exe') {
                    if (-not $files[$name].largeAddressAware) { $laaErrors += "$label $name lacks LARGE_ADDRESS_AWARE" }
                }
            }
            if ($config -eq 'Release') { $release["Parser-$platform"] = $out }
        }
        foreach ($config in 'Debug', 'Release', 'Test') {
            $label = "harvester-$platform-$config"
            $out = Build-Solution 'Blizzard API Harvester/Blizzard API Harvester.sln' $config $platform $label
            $files = @{}
            foreach ($name in 'Blizzard API Harvester.exe', 'Classic Item Detector.exe', 'Item DB Compare Tool.exe') {
                $files[$name] = Assert-Managed (Join-Path $out $name) $platform
            }
            $result.builds += @{ label = $label; files = $files }
            if ($platform -eq 'x86' -or $platform -eq 'x64') {
                foreach ($name in 'Blizzard API Harvester.exe', 'Classic Item Detector.exe', 'Item DB Compare Tool.exe') {
                    if (-not $files[$name].largeAddressAware) { $laaErrors += "$label $name lacks LARGE_ADDRESS_AWARE" }
                }
            }
            if ($config -eq 'Release') { $release["Harvester-$platform"] = $out }
        }
    }
    $result['largeAddressAwareErrors'] = $laaErrors
    . (Join-Path $env:GITHUB_WORKSPACE '.github/scripts/Test-PlatformFixtures.ps1')
    foreach ($platform in $platforms) {
        $result.fixtures += Invoke-ToolFixtures -ParserRelease $release["Parser-$platform"] -HarvesterRelease $release["Harvester-$platform"] -Arch $platform -HostArchitecture $HostArchitecture -DotnetHost $env:VERIFIED_DOTNET_HOST -Evidence $evidence
    }
    if ($laaErrors.Count) { throw ($laaErrors -join '; ') }
    $result.passed = $true
} catch {
    $result.error = $_.Exception.ToString()
    throw
} finally {
    [IO.File]::WriteAllText((Join-Path $evidence 'result.json'), ($result | ConvertTo-Json -Depth 12), [Text.UTF8Encoding]::new($false))
    Write-Host ('PLATFORM_BUILD_RESULT=' + (ConvertTo-Json -InputObject $result -Depth 12 -Compress))
}
exit 0
