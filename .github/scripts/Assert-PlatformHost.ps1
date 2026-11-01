param([Parameter(Mandatory)][ValidateSet('X64','Arm64')][string]$HostArchitecture)
$ErrorActionPreference = 'Stop'
$os = [Runtime.InteropServices.RuntimeInformation]::OSArchitecture.ToString()
$process = [Runtime.InteropServices.RuntimeInformation]::ProcessArchitecture.ToString()
if ($os -ne $HostArchitecture -or $process -ne $HostArchitecture) { throw "Expected native $HostArchitecture host, got OS=$os process=$process" }
$dotnetHost = (Get-Command dotnet -CommandType Application | Select-Object -First 1).Source
if (-not $dotnetHost) { throw 'Native dotnet host not found' }
$reader = [IO.BinaryReader]::new([IO.File]::OpenRead($dotnetHost))
try {
    $reader.BaseStream.Position = 0x3c
    $offset = $reader.ReadInt32()
    $reader.BaseStream.Position = $offset
    if ($reader.ReadUInt32() -ne 0x4550) { throw "Invalid PE: $dotnetHost" }
    $machine = $reader.ReadUInt16()
} finally { $reader.Dispose() }
$expectedMachine = if ($HostArchitecture -eq 'X64') { 0x8664 } else { 0xaa64 }
if ($machine -ne $expectedMachine) { throw "dotnet host is not native $HostArchitecture`: $dotnetHost" }
$runtimes = & $dotnetHost --list-runtimes
if ($LASTEXITCODE -ne 0 -or -not ($runtimes -match '^Microsoft.NETCore.App 8\.')) { throw "Native .NET 8 runtime not found: $dotnetHost" }
$probe = Join-Path $env:RUNNER_TEMP 'platform-msbuild-probe.proj'
@'
<Project>
  <UsingTask TaskName="ProbeHostArchitecture" TaskFactory="RoslynCodeTaskFactory" AssemblyFile="$(MSBuildToolsPath)\Microsoft.Build.Tasks.Core.dll">
    <ParameterGroup><Expected ParameterType="System.String" Required="true" /></ParameterGroup>
    <Task>
      <Using Namespace="System" />
      <Code Type="Fragment" Language="cs"><![CDATA[
        var type = typeof(object).Assembly.GetType("System.Runtime.InteropServices.RuntimeInformation");
        if (type == null) throw new Exception("RuntimeInformation type unavailable in MSBuild host");
        var architecture = type.GetProperty("ProcessArchitecture").GetValue(null, null).ToString();
        Log.LogMessage(Microsoft.Build.Framework.MessageImportance.High, "MSBUILD_HOST_ARCH=" + architecture);
        if (!String.Equals(architecture, Expected, StringComparison.OrdinalIgnoreCase))
          Log.LogError("Expected MSBuild host " + Expected + ", got " + architecture);
      ]]></Code>
    </Task>
  </UsingTask>
  <Target Name="Probe"><ProbeHostArchitecture Expected="$(ExpectedHost)" /></Target>
</Project>
'@ | Set-Content -LiteralPath $probe -Encoding utf8
$probeLog = Join-Path $env:RUNNER_TEMP "platform-msbuild-probe-$HostArchitecture.log"
& msbuild $probe -nologo -t:Probe "-p:ExpectedHost=$HostArchitecture" *> $probeLog
$code = $LASTEXITCODE
$probeText = Get-Content -LiteralPath $probeLog -Raw
Write-Host $probeText
if ($code -ne 0 -or $probeText -notmatch ("MSBUILD_HOST_ARCH=" + [regex]::Escape($HostArchitecture))) { throw 'MSBuild did not execute in the expected native architecture' }
"VERIFIED_MSBUILD_ARCH=$HostArchitecture" | Out-File -FilePath $env:GITHUB_ENV -Append -Encoding utf8
"VERIFIED_DOTNET_HOST=$dotnetHost" | Out-File -FilePath $env:GITHUB_ENV -Append -Encoding utf8
$result = @{ os = $os; process = $process; msbuild = $HostArchitecture; dotnetHost = $dotnetHost; dotnetMachine = ('0x{0:x4}' -f $machine); dotnetRuntimes = @($runtimes) }
Write-Host ('PLATFORM_HOST_RESULT=' + (ConvertTo-Json -InputObject $result -Depth 5 -Compress))
exit 0
