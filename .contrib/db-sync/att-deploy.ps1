# Windows preparation only. PowerShell 5.1 + the operating system .NET Framework.
# No compiled helper, global configuration, tracked DB write, or activation.
[CmdletBinding()]
param(
    [ValidateSet('prepare','verify','activate','selftest')][string]$Command = 'prepare',
    [string]$Source, [string]$Store, [string]$Target,
    [string]$Flavor = 'retail', [string]$Profile = 'new-cd-retail-auto',
    [string]$Recipe = 'new-cd-auto-v1', [switch]$Offline,
    [string]$Bundle, [string]$Destination, [string]$Commit, [string]$ObjectFormat,
    [switch]$LibraryOnly
)
Set-StrictMode -Version 2
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem
Add-Type -AssemblyName System.Net.Http
$script:AttRepository = 'ATTWoWAddon/AllTheThings'
$script:AttUtf8 = New-Object System.Text.UTF8Encoding($false, $true)
$script:AttRoots = New-Object 'System.Collections.Generic.Dictionary[string,string]' ([StringComparer]::Ordinal)
foreach($attRootPair in (@{retail='Standard'; era='Vanilla'; sod='VanillaSOD'; tbc='TBC'; wrath='Wrath'; cata='Cata'; mists='Mists'; forever='Camelot'}).GetEnumerator()) { $script:AttRoots.Add($attRootPair.Key,$attRootPair.Value) }

function New-AttMap { return ,(New-Object 'System.Collections.Generic.Dictionary[string,object]' ([StringComparer]::Ordinal)) }
function Get-AttKeys($Map) { $keys = [string[]]@($Map.Keys); [Array]::Sort($keys, [StringComparer]::Ordinal); return ,$keys }
function Assert-AttMap($Value) { if ($Value -isnot [System.Collections.IDictionary]) { throw 'Expected JSON object' } }
function Assert-AttText($Value) { if ($Value -isnot [string]) { throw 'Expected JSON string' }; return $Value }
function Assert-AttInteger($Value) { if (($Value -isnot [long]) -and ($Value -isnot [int])) { throw 'Expected integer' }; return [long]$Value }
function Assert-AttToken($Value) { $v = Assert-AttText $Value; if ($v -cnotmatch '^[A-Za-z0-9][A-Za-z0-9_.-]{0,127}$') { throw 'Invalid identity token' }; return $v }
function Assert-AttOid([string]$Value, [string]$Format = '') {
    $length = 0; if ($Format -eq 'sha1') { $length = 40 } elseif ($Format -eq 'sha256') { $length = 64 }
    if (($Format -and -not $length) -or $Value -cnotmatch '^(?:[0-9a-f]{40}|[0-9a-f]{64})$' -or ($length -and $Value.Length -ne $length)) { throw 'Full lowercase commit matching object format required' }
    return $Value
}
function ConvertTo-AttCanonical($Value) {
    if ($Value -is [System.Collections.IDictionary]) {
        $parts = @(); foreach ($key in (Get-AttKeys $Value)) { $parts += ((ConvertTo-Json -InputObject ([string]$key) -Compress) + ':' + (ConvertTo-AttCanonical $Value[$key])) }
        return '{' + ($parts -join ',') + '}'
    }
    if ($Value -is [System.Array]) { $parts = @(); foreach ($item in $Value) { $parts += ConvertTo-AttCanonical $item }; return '[' + ($parts -join ',') + ']' }
    return (ConvertTo-Json -InputObject $Value -Compress -Depth 100)
}

# A small recursive JSON parser. ConvertFrom-Json silently accepts duplicate keys
# on several supported versions; names are compared after decoding escapes.
function Skip-AttJsonSpace { while ($script:AttJsonIndex -lt $script:AttJsonText.Length -and (" `t`r`n").IndexOf($script:AttJsonText[$script:AttJsonIndex]) -ge 0) { $script:AttJsonIndex++ } }
function Read-AttJsonString {
    if ($script:AttJsonText[$script:AttJsonIndex] -ne '"') { throw 'Expected JSON string' }; $script:AttJsonIndex++
    $out = New-Object System.Text.StringBuilder
    while ($script:AttJsonIndex -lt $script:AttJsonText.Length) {
        $c = $script:AttJsonText[$script:AttJsonIndex++]; if ($c -eq '"') { return $out.ToString() }
        if ([int]$c -lt 32) { throw 'Control character in JSON string' }
        if ($c -eq '\') {
            if ($script:AttJsonIndex -ge $script:AttJsonText.Length) { throw 'Incomplete JSON escape' }
            $e = $script:AttJsonText[$script:AttJsonIndex++]
            switch -CaseSensitive ($e) {
                '"' { [void]$out.Append('"') }; '\' { [void]$out.Append('\') }; '/' { [void]$out.Append('/') }
                'b' { [void]$out.Append([char]8) }; 'f' { [void]$out.Append([char]12) }; 'n' { [void]$out.Append([char]10) }; 'r' { [void]$out.Append([char]13) }; 't' { [void]$out.Append([char]9) }
                'u' {
                    if ($script:AttJsonIndex + 4 -gt $script:AttJsonText.Length) { throw 'Incomplete Unicode escape' }
                    $hex = $script:AttJsonText.Substring($script:AttJsonIndex, 4); if ($hex -cnotmatch '^[0-9a-fA-F]{4}$') { throw 'Invalid Unicode escape' }
                    $script:AttJsonIndex += 4; $cp = [Convert]::ToInt32($hex, 16)
                    if ($cp -ge 0xD800 -and $cp -le 0xDBFF) {
                        if ($script:AttJsonIndex + 6 -gt $script:AttJsonText.Length -or $script:AttJsonText.Substring($script:AttJsonIndex, 2) -cne '\u') { throw 'Unpaired high surrogate' }
                        $hex2 = $script:AttJsonText.Substring($script:AttJsonIndex + 2, 4); if ($hex2 -cnotmatch '^[0-9a-fA-F]{4}$') { throw 'Invalid low surrogate' }
                        $cp2 = [Convert]::ToInt32($hex2, 16); if ($cp2 -lt 0xDC00 -or $cp2 -gt 0xDFFF) { throw 'Unpaired high surrogate' }
                        $script:AttJsonIndex += 6; [void]$out.Append([char]$cp); [void]$out.Append([char]$cp2)
                    } elseif ($cp -ge 0xDC00 -and $cp -le 0xDFFF) { throw 'Unpaired low surrogate' } else { [void]$out.Append([char]$cp) }
                }
                default { throw 'Unknown JSON escape' }
            }
        } elseif ([char]::IsSurrogate($c)) {
            if (-not [char]::IsHighSurrogate($c) -or $script:AttJsonIndex -ge $script:AttJsonText.Length -or -not [char]::IsLowSurrogate($script:AttJsonText[$script:AttJsonIndex])) { throw 'Unpaired literal surrogate' }
            [void]$out.Append($c); [void]$out.Append($script:AttJsonText[$script:AttJsonIndex++])
        } else { [void]$out.Append($c) }
    }; throw 'Unterminated JSON string'
}
function Read-AttJsonValue([int]$Depth = 0) {
    if ($Depth -gt 64) { throw 'JSON nesting limit exceeded' }; Skip-AttJsonSpace
    if ($script:AttJsonIndex -ge $script:AttJsonText.Length) { throw 'Unexpected JSON end' }
    $c = $script:AttJsonText[$script:AttJsonIndex]
    if ($c -eq '"') { return Read-AttJsonString }
    if ($c -eq '{') {
        $map = New-AttMap; $script:AttJsonIndex++; Skip-AttJsonSpace
        if ($script:AttJsonIndex -lt $script:AttJsonText.Length -and $script:AttJsonText[$script:AttJsonIndex] -eq '}') { $script:AttJsonIndex++; return ,$map }
        while ($true) {
            Skip-AttJsonSpace; $key = Read-AttJsonString; if ($map.ContainsKey($key)) { throw 'Duplicate JSON key' }
            Skip-AttJsonSpace; if ($script:AttJsonIndex -ge $script:AttJsonText.Length -or $script:AttJsonText[$script:AttJsonIndex++] -ne ':') { throw 'Missing JSON colon' }
            $map.Add($key, (Read-AttJsonValue ($Depth + 1))); Skip-AttJsonSpace
            if ($script:AttJsonIndex -ge $script:AttJsonText.Length) { throw 'Unterminated JSON object' }; $next = $script:AttJsonText[$script:AttJsonIndex++]
            if ($next -eq '}') { return ,$map }; if ($next -ne ',') { throw 'Missing JSON comma' }
        }
    }
    if ($c -eq '[') {
        $values = New-Object 'System.Collections.Generic.List[object]'; $script:AttJsonIndex++; Skip-AttJsonSpace
        if ($script:AttJsonIndex -lt $script:AttJsonText.Length -and $script:AttJsonText[$script:AttJsonIndex] -eq ']') { $script:AttJsonIndex++; return ,([object[]]@()) }
        while ($true) {
            $values.Add((Read-AttJsonValue ($Depth + 1))); Skip-AttJsonSpace
            if ($script:AttJsonIndex -ge $script:AttJsonText.Length) { throw 'Unterminated JSON array' }; $next = $script:AttJsonText[$script:AttJsonIndex++]
            if ($next -eq ']') { return ,$values.ToArray() }; if ($next -ne ',') { throw 'Missing JSON comma' }
        }
    }
    foreach ($literal in @('true','false','null')) {
        if ($script:AttJsonText.Substring($script:AttJsonIndex).StartsWith($literal, [StringComparison]::Ordinal)) {
            $script:AttJsonIndex += $literal.Length; if ($literal -eq 'true') { return $true }; if ($literal -eq 'false') { return $false }; return $null
        }
    }
    $match = [regex]::Match($script:AttJsonText.Substring($script:AttJsonIndex), '^-?(?:0|[1-9][0-9]*)(?:\.[0-9]+)?(?:[eE][+-]?[0-9]+)?')
    if (-not $match.Success) { throw 'Invalid JSON value' }; $script:AttJsonIndex += $match.Length
    if ($match.Value -notmatch '[.eE]') { return [long]::Parse($match.Value, [Globalization.CultureInfo]::InvariantCulture) }
    $n = [double]::Parse($match.Value, [Globalization.CultureInfo]::InvariantCulture); if ([double]::IsInfinity($n) -or [double]::IsNaN($n)) { throw 'Nonfinite JSON number' }; return $n
}
function ConvertFrom-AttJson([string]$Text) {
    if ($script:AttUtf8.GetByteCount($Text) -gt 4194304) { throw 'JSON size limit' }
    $script:AttJsonText = $Text; $script:AttJsonIndex = 0; $result = Read-AttJsonValue; Skip-AttJsonSpace
    if ($script:AttJsonIndex -ne $Text.Length) { throw 'Trailing JSON input' }; return ,$result
}
function Assert-AttNoLinks([string]$Path) {
    $full = [IO.Path]::GetFullPath($Path); $current = $full
    while ($current) {
        $attributes=$null; try { $attributes=[IO.File]::GetAttributes($current) } catch [IO.FileNotFoundException] { } catch [IO.DirectoryNotFoundException] { }
        if ($null -ne $attributes -and ($attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) { throw 'Linked/reparse path refused' }
        $parent = [IO.Path]::GetDirectoryName($current); if ($parent -eq $current) { break }; $current = $parent
    }; if ($full -eq [IO.Path]::GetPathRoot($full)) { return $full }; return $full.TrimEnd([IO.Path]::DirectorySeparatorChar)
}
function Assert-AttFile([string]$Path, [long]$Limit = 536870912) {
    [void](Assert-AttNoLinks $Path)
    if (-not [IO.File]::Exists($Path) -or ([IO.File]::GetAttributes($Path) -band ([IO.FileAttributes]::Directory -bor [IO.FileAttributes]::Device -bor [IO.FileAttributes]::ReparsePoint)) -ne 0 -or (New-Object IO.FileInfo($Path)).Length -gt $Limit) { throw 'Bounded regular file required' }
}
function Read-AttJson([string]$Path) { Assert-AttFile $Path 4194304; $v = ConvertFrom-AttJson ($script:AttUtf8.GetString([IO.File]::ReadAllBytes($Path))); Assert-AttMap $v; return ,$v }
function Get-AttHash([byte[]]$Bytes) { $sha = [Security.Cryptography.SHA256]::Create(); try { return ([BitConverter]::ToString($sha.ComputeHash($Bytes))).Replace('-','').ToLowerInvariant() } finally { $sha.Dispose() } }
function Get-AttFileHash([string]$Path) { Assert-AttFile $Path; $stream = [IO.File]::OpenRead($Path); $sha = [Security.Cryptography.SHA256]::Create(); try { return ([BitConverter]::ToString($sha.ComputeHash($stream))).Replace('-','').ToLowerInvariant() } finally { $stream.Dispose(); $sha.Dispose() } }
function Write-AttNew([string]$Path, [byte[]]$Bytes) { [void](Assert-AttNoLinks $Path); $s = New-Object IO.FileStream($Path, [IO.FileMode]::CreateNew, [IO.FileAccess]::Write, [IO.FileShare]::None); try { $s.Write($Bytes,0,$Bytes.Length); $s.Flush($true) } finally { $s.Dispose() } }
function Write-AttJsonNew([string]$Path, $Value) { Write-AttNew $Path ($script:AttUtf8.GetBytes((ConvertTo-Json -InputObject $Value -Depth 100) + "`n")) }
function Write-AttJsonAtomic([string]$Path, $Value) {
    [void](Assert-AttNoLinks $Path); $tmp = $Path + '.' + [guid]::NewGuid().ToString('N') + '.tmp'; Write-AttJsonNew $tmp $Value
    try { if ([IO.File]::Exists($Path)) { [IO.File]::Replace($tmp,$Path,$null) } else { [IO.File]::Move($tmp,$Path) } } finally { if ([IO.File]::Exists($tmp)) { [IO.File]::Delete($tmp) } }
}
function Assert-AttSeparate([string[]]$Paths) {
    $full = @(); foreach ($p in $Paths) { $canonical=Assert-AttNoLinks $p; if ([Environment]::OSVersion.Platform -eq [PlatformID]::Win32NT) { $canonical=Assert-AttWindowsPath $p }; $full += $canonical.Normalize([Text.NormalizationForm]::FormC).Replace('\','/').TrimEnd('/') }
    for ($i=0; $i -lt $full.Count; $i++) { for ($j=$i+1; $j -lt $full.Count; $j++) { if ($full[$i].Equals($full[$j],[StringComparison]::OrdinalIgnoreCase) -or $full[$i].StartsWith($full[$j] + '/', [StringComparison]::OrdinalIgnoreCase) -or $full[$j].StartsWith($full[$i] + '/', [StringComparison]::OrdinalIgnoreCase)) { throw 'Source/store/target/stage paths must be separate' } } }
}
function Assert-AttWindowsLongPath([string]$Path) {
    if ($Path -notmatch '^[A-Za-z]:[\\/]') { throw 'Absolute local drive-letter path required' }
    foreach($part in $Path.Substring(3).Replace('/','\').Split('\')) { if (-not $part -or $part -in @('.','..') -or $part.EndsWith('.') -or $part.EndsWith(' ')) { throw 'Canonical Windows components without trailing dot/space required' } }
    $full=[IO.Path]::GetFullPath($Path); $root=[IO.Path]::GetPathRoot($full); $current=$root
    foreach($part in $full.Substring($root.Length).Split([IO.Path]::DirectorySeparatorChar)) {
        if (-not [IO.Directory]::Exists($current)) { break }; $candidate=Join-Path $current $part; $exists=$false
        try { [void][IO.File]::GetAttributes($candidate); $exists=$true } catch [IO.FileNotFoundException] { } catch [IO.DirectoryNotFoundException] { }
        if (-not $exists) { break }; $matches=@([IO.Directory]::EnumerateFileSystemEntries($current) | Where-Object {[IO.Path]::GetFileName($_).Equals($part,[StringComparison]::OrdinalIgnoreCase)})
        if ($matches.Count -ne 1) { throw 'Short-name or ambiguous filesystem aliases are unsupported' }; $current=$matches[0]
    }; return $full
}
function Assert-AttWindowsPath([string]$Path) {
    $full=Assert-AttWindowsLongPath $Path; $drive=$full.Substring(0,2)
    $volume=@(Get-CimInstance -ClassName Win32_Volume -Filter ("DriveLetter='"+$drive+"'")); if ($volume.Count -ne 1 -or $volume[0].FileSystem -cne 'NTFS') { throw 'Local NTFS physical volume required; drive aliases are unsupported' }; return $full
}
function Assert-AttSafePath([string]$Path) {
    if (-not $Path -or $Path.StartsWith('/') -or $Path.Contains('\')) { throw 'Relative POSIX path required' }
    foreach ($part in $Path.Split('/')) { if ($part -eq '' -or $part -eq '.' -or $part -eq '..' -or $part -match '^(?i:CON|PRN|AUX|NUL|COM[1-9]|LPT[1-9])(?:\.|$)' -or $part -match '[\x00-\x1f\x7f-\uffff:<>"|?*]' -or $part.EndsWith('.') -or $part.EndsWith(' ')) { throw 'Nonportable/unsafe artifact path' } }; return $Path
}
function Assert-AttPathSet([string[]]$Paths) {
    $seen = New-Object 'System.Collections.Generic.HashSet[string]' ([StringComparer]::OrdinalIgnoreCase)
    $prefix = New-AttMap
    foreach ($path in $Paths) {
        [void](Assert-AttSafePath $path); if (-not $seen.Add($path)) { throw 'Duplicate/case-colliding paths' }
        $parts = $path.Split('/'); for ($i=1; $i -le $parts.Length; $i++) { $p = ($parts[0..($i-1)] -join '/'); $fold = $p.ToUpperInvariant(); if ($prefix.ContainsKey($fold) -and $prefix[$fold] -cne $p) { throw 'Case-colliding parent paths' }; $prefix[$fold]=$p }
    }
    foreach ($path in $Paths) { $parts=$path.Split('/'); for ($i=1;$i -lt $parts.Length;$i++) { if ($seen.Contains(($parts[0..($i-1)] -join '/'))) { throw 'File/directory path collision' } } }
}
function Quote-AttArgument([string]$Text) { if ($Text.Contains([char]0)) { throw 'NUL process argument' }; return '"' + ([regex]::Replace(([regex]::Replace($Text,'(\\*)"','$1$1\"')),'(\\+)$','$1$1')) + '"' }
function Invoke-AttProcess([string]$Exe, [string[]]$Arguments, [string]$Cwd, [switch]$Binary, [switch]$StripTokens, [switch]$IncludeStderr, [int]$Timeout = 300000, [long]$MaxOutput = 536870912, [byte[]]$InputData = $null) {
    $start=New-Object Diagnostics.ProcessStartInfo; $start.FileName=$Exe; $start.Arguments=(@($Arguments | ForEach-Object { Quote-AttArgument $_ }) -join ' '); $start.WorkingDirectory=$Cwd; $start.UseShellExecute=$false; $start.RedirectStandardOutput=$true; $start.RedirectStandardError=$true; $start.CreateNoWindow=$true
    $start.EnvironmentVariables['GIT_TERMINAL_PROMPT']='0'; $start.EnvironmentVariables['GIT_OPTIONAL_LOCKS']='0'; $start.EnvironmentVariables['GIT_NO_REPLACE_OBJECTS']='1'; $start.RedirectStandardInput=($null -ne $InputData)
    if ($StripTokens) { foreach($key in @($start.EnvironmentVariables.Keys)) { if ($key -match '^(?:GITHUB_|ACTIONS_)' -or $key -in @('GH_TOKEN','GITHUB_TOKEN')) { $start.EnvironmentVariables.Remove($key) } } }
    $p=New-Object Diagnostics.Process; $p.StartInfo=$start; $output=New-Object IO.MemoryStream; $errors=New-Object IO.MemoryStream; $started=$false
    try {
        [void]$p.Start(); $started=$true; $clock=[Diagnostics.Stopwatch]::StartNew(); $outBuffer=New-Object byte[] 65536; $errBuffer=New-Object byte[] 65536
        $outTask=$p.StandardOutput.BaseStream.ReadAsync($outBuffer,0,$outBuffer.Length); $errTask=$p.StandardError.BaseStream.ReadAsync($errBuffer,0,$errBuffer.Length)
        $inputTask=$null; if ($null -ne $InputData) { if ($InputData.Length -gt 4194304) { throw 'Process stdin limit' }; $inputTask=$p.StandardInput.BaseStream.WriteAsync($InputData,0,$InputData.Length) }
        while ($null -ne $outTask -or $null -ne $errTask -or $null -ne $inputTask) {
            $remaining=$Timeout-[int]$clock.ElapsedMilliseconds; if ($remaining -le 0) { throw 'Process timeout' }
            $pending=New-Object 'System.Collections.Generic.List[System.Threading.Tasks.Task]'; if ($null -ne $outTask) { $pending.Add($outTask) }; if ($null -ne $errTask) { $pending.Add($errTask) }; if ($null -ne $inputTask) { $pending.Add($inputTask) }
            if ([Threading.Tasks.Task]::WaitAny($pending.ToArray(),$remaining) -lt 0) { throw 'Process timeout' }
            if ($null -ne $outTask -and $outTask.IsCompleted) { $n=$outTask.GetAwaiter().GetResult(); if ($n -gt $MaxOutput-$output.Length) { throw 'Process stdout size limit' }; if ($n) { $output.Write($outBuffer,0,$n); $outTask=$p.StandardOutput.BaseStream.ReadAsync($outBuffer,0,$outBuffer.Length) } else { $outTask=$null } }
            if ($null -ne $errTask -and $errTask.IsCompleted) { $n=$errTask.GetAwaiter().GetResult(); if ($n -gt 16777216-$errors.Length) { throw 'Process stderr size limit' }; if ($n) { $errors.Write($errBuffer,0,$n); $errTask=$p.StandardError.BaseStream.ReadAsync($errBuffer,0,$errBuffer.Length) } else { $errTask=$null } }
            if ($null -ne $inputTask -and $inputTask.IsCompleted) { $inputTask.GetAwaiter().GetResult(); $p.StandardInput.BaseStream.Close(); $inputTask=$null }
        }
        $remaining=$Timeout-[int]$clock.ElapsedMilliseconds; if ($remaining -le 0 -or -not $p.WaitForExit($remaining)) { throw 'Process timeout' }
        $stderr=[Text.Encoding]::UTF8.GetString($errors.ToArray()); if ($p.ExitCode -ne 0) { throw ('Process failed: '+$Exe+': '+$stderr) }; $bytes=$output.ToArray(); if ($Binary) { return ,$bytes }; $text=$script:AttUtf8.GetString($bytes); if ($IncludeStderr) { $text+="`n"+$stderr }; return $text
    } finally { if ($started -and -not $p.HasExited) { $p.Kill(); [void]$p.WaitForExit(5000) }; $p.Dispose(); $output.Dispose(); $errors.Dispose() }
}
function Invoke-AttGit([string]$SourcePath, [string[]]$Arguments, [switch]$Binary, [byte[]]$InputData = $null) { return Invoke-AttProcess 'git' (@('--no-optional-locks','-c','core.hooksPath=/dev/null','-c','core.fsmonitor=false','-c','core.untrackedCache=false')+$Arguments) $SourcePath -Binary:$Binary -InputData $InputData }
function Export-AttGitBlobs([string]$RepositoryPath,[string]$Format,$Expected,[string]$Output) {
    if ($Format -cnotin @('sha1','sha256') -or -not $Expected.Count -or $Expected.Count -gt 20000) { throw 'Explicit bounded Git blob set required' }
    $names=Get-AttKeys $Expected; Assert-AttPathSet $names; $requests=New-Object Text.StringBuilder
    foreach($name in $names) { [void](Assert-AttOid $Expected[$name]['oid'] $Format); [void]$requests.Append($Expected[$name]['oid']).Append("`n") }
    # Batch raw Git objects ignore export-ignore/export-subst and working files.
    # Recompute each blob object ID before any exclusive destination write.
    $bytes=Invoke-AttGit $RepositoryPath @('cat-file','--batch') -Binary -InputData ($script:AttUtf8.GetBytes($requests.ToString())); $index=0; $total=[long]0
    [void][IO.Directory]::CreateDirectory($Output)
    foreach($name in $names) {
        $start=$index; while($index -lt $bytes.Length -and $bytes[$index] -ne 10 -and $index-$start -le 128) { $index++ }; if ($index -ge $bytes.Length -or $index-$start -gt 128) { throw 'Invalid Git batch header' }; $header=[Text.Encoding]::ASCII.GetString($bytes,$start,$index-$start); $index++
        if ($header -cnotmatch '^([0-9a-f]{40}|[0-9a-f]{64}) blob ([0-9]+)$' -or $Matches[1] -cne $Expected[$name]['oid']) { throw 'Git blob identity/type mismatch' }; $size=[long]::Parse($Matches[2],[Globalization.CultureInfo]::InvariantCulture)
        if ($size -gt 134217728 -or $size -gt 1073741824-$total -or $size -ge $bytes.Length-$index) { throw 'Git blob byte limit/truncation' }; $total+=$size; $body=New-Object byte[] ([int]$size); [Buffer]::BlockCopy($bytes,$index,$body,0,[int]$size); $index+=[int]$size; if ($bytes[$index++] -ne 10) { throw 'Git batch separator mismatch' }
        $prefix=$script:AttUtf8.GetBytes('blob '+$size.ToString([Globalization.CultureInfo]::InvariantCulture)+[char]0); $algorithm=$null; if ($Format -eq 'sha1') { $algorithm=[Security.Cryptography.SHA1]::Create() } else { $algorithm=[Security.Cryptography.SHA256]::Create() }
        try { [void]$algorithm.TransformBlock($prefix,0,$prefix.Length,$prefix,0); [void]$algorithm.TransformFinalBlock($body,0,$body.Length); $digest=([BitConverter]::ToString($algorithm.Hash)).Replace('-','').ToLowerInvariant() } finally { $algorithm.Dispose() }; if ($digest -cne $Expected[$name]['oid']) { throw 'Git blob bytes do not match exact object ID' }
        if ([Text.Encoding]::ASCII.GetString($body,0,[Math]::Min(128,$body.Length)).StartsWith('version https://git-lfs.github.com/spec/v1',[StringComparison]::Ordinal)) { throw 'Unresolved source LFS pointer' }
        $target=Join-Path $Output $name; [void][IO.Directory]::CreateDirectory([IO.Path]::GetDirectoryName($target)); Write-AttNew $target $body
    }; if ($index -ne $bytes.Length) { throw 'Unexpected trailing Git batch bytes' }
}
function Copy-AttBounded($InputStream,$OutputStream,[long]$Expected) {
    if ($Expected -lt 0 -or $Expected -gt 134217728) { throw 'Stream member size limit' }; $buffer=New-Object byte[] 65536; $written=[long]0
    while(($n=$InputStream.Read($buffer,0,$buffer.Length)) -gt 0) { if ($n -gt $Expected-$written) { throw 'Stream exceeds declared member size' }; $OutputStream.Write($buffer,0,$n); $written+=$n }; if ($written -ne $Expected) { throw 'Incomplete source member stream' }; $OutputStream.Flush($true)
}
function Get-AttInventory([string]$Root, [switch]$DbOnly) {
    [void](Assert-AttNoLinks $Root); if (-not [IO.Directory]::Exists($Root)) { throw 'Inventory root missing' }
    $files=New-AttMap; $rootPath=[IO.Path]::GetFullPath($Root).TrimEnd([IO.Path]::DirectorySeparatorChar)
    $pending=New-Object 'System.Collections.Generic.Stack[string]'; $pending.Push($rootPath)
    while($pending.Count) { $directory=$pending.Pop(); foreach($path in [IO.Directory]::EnumerateFileSystemEntries($directory)) { [void](Assert-AttNoLinks $path); if ([IO.Directory]::Exists($path)) { $pending.Push($path); continue }; Assert-AttFile $path 134217728; $name=$path.Substring($rootPath.Length+1).Replace('\','/'); [void](Assert-AttSafePath $name); $size=(New-Object IO.FileInfo($path)).Length; if ($DbOnly -and ($size -le 0 -or [IO.Path]::GetExtension($name).ToLowerInvariant() -notin @('.lua','.xml'))) { throw 'Unexpected or empty DB file' }; $files.Add($name,@{sha256=(Get-AttFileHash $path);size=$size}) } }
    Assert-AttPathSet ([string[]]@($files.Keys)); return ,$files
}
function Get-AttXmlClosure([string]$Root, [string]$Start, $Files) {
    $seen=New-Object 'System.Collections.Generic.HashSet[string]' ([StringComparer]::Ordinal); $active=New-Object 'System.Collections.Generic.HashSet[string]' ([StringComparer]::Ordinal)
    function Visit-AttXml([string]$Path) {
        if ($active.Contains($Path)) { throw 'XML dependency cycle' }; if ($seen.Contains($Path)) { return }; if (-not $Files.ContainsKey($Path)) { throw 'Missing XML dependency' }; [void]$seen.Add($Path)
        if (-not $Path.EndsWith('.xml',[StringComparison]::OrdinalIgnoreCase)) { return }; [void]$active.Add($Path)
        $settings=New-Object Xml.XmlReaderSettings; $settings.DtdProcessing=[Xml.DtdProcessing]::Prohibit; $settings.XmlResolver=$null; $reader=[Xml.XmlReader]::Create((Join-Path $Root $Path),$settings)
        try { while($reader.Read()) { if ($reader.NodeType -eq [Xml.XmlNodeType]::Element -and $reader.LocalName -in @('Script','Include')) { $type=$reader.LocalName; $raw=$reader.GetAttribute('file'); if (-not $raw -or $raw.StartsWith('/') -or $raw.StartsWith('\') -or $raw.Contains(':')) { throw 'Unsafe XML dependency' }; $parts=New-Object 'System.Collections.Generic.List[string]'; foreach($p in @($Path.Split('/') | Select-Object -SkipLast 1)) { $parts.Add($p) }; foreach($part in $raw.Replace('\','/').Split('/')) { if ($part -eq '.') { continue }; if ($part -eq '..') { if (-not $parts.Count) { throw 'XML dependency escapes root' }; $parts.RemoveAt($parts.Count-1) } else { $parts.Add($part) } }; $next=Assert-AttSafePath ($parts -join '/'); $ext='.lua'; if ($type -eq 'Include') { $ext='.xml' }; if (-not $next.EndsWith($ext,[StringComparison]::OrdinalIgnoreCase)) { throw 'Wrong XML dependency type' }; Visit-AttXml $next } } } finally { $reader.Dispose() }; [void]$active.Remove($Path)
    }
    Visit-AttXml $Start; return ,([string[]]@($seen))
}
function Read-AttManifest([string]$Path) {
    Assert-AttFile $Path 8388608; $text=$script:AttUtf8.GetString([IO.File]::ReadAllBytes($Path)); if (-not $text.EndsWith("`n") -or $text.Contains("`r")) { throw 'Manifest requires LF terminated lines' }
    $map=New-AttMap; $last=$null; foreach($line in $text.Substring(0,$text.Length-1).Split("`n")) { if ($line -cnotmatch '^([0-9a-f]{64})  (.+)$') { throw 'Invalid manifest line' }; $hash=$Matches[1]; $path=Assert-AttSafePath $Matches[2]; if ($map.ContainsKey($path) -or ($null -ne $last -and [string]::CompareOrdinal($last,$path) -ge 0)) { throw 'Manifest duplicate/unsorted path' }; $map.Add($path,$hash); $last=$path }; if (-not $map.Count -or $map.Count -gt 20000) { throw 'Manifest entry limit' }; Assert-AttPathSet ([string[]]@($map.Keys)); return ,$map
}
function Read-AttZipHeaders([string]$Path) {
    Assert-AttFile $Path; $s=[IO.File]::OpenRead($Path); $r=New-Object IO.BinaryReader($s)
    try {
        if ($s.Length -lt 22) { throw 'Truncated ZIP' }; $tailLength=[int][Math]::Min(65557,$s.Length); $s.Position=$s.Length-$tailLength; $tail=$r.ReadBytes($tailLength); $end=-1
        for($i=$tail.Length-22;$i -ge 0;$i--) { if ([BitConverter]::ToUInt32($tail,$i) -eq 0x06054b50 -and $i+22+[BitConverter]::ToUInt16($tail,$i+20) -eq $tail.Length) { $end=$i; break } }; if ($end -lt 0) { throw 'ZIP end/trailing bytes invalid' }
        $count=[BitConverter]::ToUInt16($tail,$end+10); $size=[BitConverter]::ToUInt32($tail,$end+12); $offset=[BitConverter]::ToUInt32($tail,$end+16)
        if ([BitConverter]::ToUInt16($tail,$end+4) -ne 0 -or [BitConverter]::ToUInt16($tail,$end+6) -ne 0 -or [BitConverter]::ToUInt16($tail,$end+8) -ne $count -or -not $count -or $count -gt 20000 -or $count -eq 65535 -or $size -eq [uint32]::MaxValue -or $offset -eq [uint32]::MaxValue -or [long]$offset+$size -ne $s.Length-$tailLength+$end) { throw 'ZIP multidisk/ZIP64/directory limit' }
        $s.Position=$offset; $entries=New-Object 'System.Collections.Generic.List[object]'; $total=[long]0
        for($i=0;$i -lt $count;$i++) {
            $h=$r.ReadBytes(46); if ($h.Length -ne 46 -or [BitConverter]::ToUInt32($h,0) -ne 0x02014b50) { throw 'ZIP central header invalid' }
            $flags=[BitConverter]::ToUInt16($h,8); $method=[BitConverter]::ToUInt16($h,10); $compressed=[BitConverter]::ToUInt32($h,20); $length=[BitConverter]::ToUInt32($h,24); $n=[BitConverter]::ToUInt16($h,28); $extra=[BitConverter]::ToUInt16($h,30); $comment=[BitConverter]::ToUInt16($h,32); $attrs=[BitConverter]::ToUInt32($h,38); $local=[BitConverter]::ToUInt32($h,42)
            if (($flags -band 0x2041) -ne 0 -or $method -notin @(0,8) -or [BitConverter]::ToUInt16($h,34) -ne 0 -or -not $n -or $compressed -eq [uint32]::MaxValue -or $length -eq [uint32]::MaxValue -or $local -eq [uint32]::MaxValue -or ($attrs -band 0x450) -ne 0 -or (($attrs -shr 16) -band 0xF000) -notin @(0,0x8000)) { throw 'ZIP unsupported/encrypted/special member' }
            if ($length -gt 134217728 -or $length -gt 1073741824-$total -or $length -gt [long][Math]::Max(1,$compressed)*200) { throw 'ZIP expansion limit' }; $total+=$length
            $raw=$r.ReadBytes($n); if ($raw.Length -ne $n -or @($raw | Where-Object {$_ -lt 32 -or $_ -gt 126}).Count) { throw 'ZIP unsafe name bytes' }; $name=Assert-AttSafePath ([Text.Encoding]::ASCII.GetString($raw)); $s.Position+=$extra+$comment
            if ($s.Position -gt [long]$offset+$size -or [long]$local+30+$compressed -gt $offset) { throw 'ZIP member offsets invalid' }
            $entries.Add(@{name=$name;size=[long]$length;compressed=[long]$compressed;flags=$flags;method=$method;local=[long]$local;crc=[BitConverter]::ToUInt32($h,16)})
        }; if ($s.Position -ne [long]$offset+$size) { throw 'ZIP central size mismatch' }
        Assert-AttPathSet ([string[]]@($entries | ForEach-Object {$_.name})); $ranges=New-Object 'System.Collections.Generic.List[object]'
        foreach($e in $entries) {
            $s.Position=$e.local; $h=$r.ReadBytes(30); if ($h.Length -ne 30 -or [BitConverter]::ToUInt32($h,0) -ne 0x04034b50 -or [BitConverter]::ToUInt16($h,6) -ne $e.flags -or [BitConverter]::ToUInt16($h,8) -ne $e.method) { throw 'ZIP local/central header mismatch' }; $n=[BitConverter]::ToUInt16($h,26); $extra=[BitConverter]::ToUInt16($h,28); $raw=$r.ReadBytes($n)
            if ($raw.Length -ne $n -or [Text.Encoding]::ASCII.GetString($raw) -cne $e.name -or $s.Position+$extra+$e.compressed -gt $offset) { throw 'ZIP local name/size mismatch' }
            if (($e.flags -band 8) -eq 0 -and ([BitConverter]::ToUInt32($h,14) -ne $e.crc -or [BitConverter]::ToUInt32($h,18) -ne $e.compressed -or [BitConverter]::ToUInt32($h,22) -ne $e.size)) { throw 'ZIP local sizes/CRC mismatch' }
            $dataEnd=$s.Position+$extra+$e.compressed
            if (($e.flags -band 8) -ne 0) {
                if ($dataEnd+12 -gt $offset) { throw 'ZIP data descriptor truncated' }; $s.Position=$dataEnd; $descriptor=$r.ReadBytes([int][Math]::Min(16,$offset-$dataEnd)); $skip=0
                if ([BitConverter]::ToUInt32($descriptor,0) -eq 0x08074b50) { $skip=4 }
                if ($descriptor.Length -lt $skip+12 -or [BitConverter]::ToUInt32($descriptor,$skip) -ne $e.crc -or [BitConverter]::ToUInt32($descriptor,$skip+4) -ne $e.compressed -or [BitConverter]::ToUInt32($descriptor,$skip+8) -ne $e.size) { throw 'ZIP data descriptor checksum/sizes mismatch' }; $dataEnd+=$skip+12
            }
            $ranges.Add(@{start=$e.local;end=$dataEnd})
        }
        $lastEnd=[long]0; foreach($range in @($ranges | Sort-Object start)) { if ($range.start -lt $lastEnd) { throw 'ZIP overlapping member ranges' }; $lastEnd=$range.end }
        return ,$entries.ToArray()
    } finally { $r.Dispose(); $s.Dispose() }
}
function Assert-AttDescriptor($Value, [string]$Path, [string]$Expected) {
    Assert-AttMap $Value; $size=Assert-AttInteger $Value['size']; $name=Assert-AttText $Value['name']; $digest=Assert-AttText $Value['sha256']; if ($name -cne $Expected -or $digest -cnotmatch '^[0-9a-f]{64}$' -or $size -le 0 -or (New-Object IO.FileInfo($Path)).Length -ne $size -or (Get-AttFileHash $Path) -cne $digest) { throw 'Artifact envelope hash/size/name mismatch' }
}
function Test-AttBundle([string]$Directory, [string]$Output, $Identity) {
    Assert-AttMap $Identity; if (((Get-AttKeys $Identity) -join ',') -cne 'commit,flavor,object_format,profile,recipe') { throw 'Exact five-field request identity required' }; [void](Assert-AttText $Identity['commit']); [void](Assert-AttText $Identity['object_format']); if ($Identity['object_format'] -cnotin @('sha1','sha256')) { throw 'Explicit Git object format required' }; [void](Assert-AttOid $Identity['commit'] $Identity['object_format']); foreach($field in @('flavor','profile','recipe')) { [void](Assert-AttToken $Identity[$field]) }
    Assert-AttSeparate @($Directory,$Output); [void](Assert-AttNoLinks $Output); if ([IO.File]::Exists($Output) -or ([IO.Directory]::Exists($Output) -and @([IO.Directory]::EnumerateFileSystemEntries($Output)).Count)) { throw 'Extraction requires new/empty directory' }
    $prefix='db-'+$Identity['object_format']+'-'+$Identity['commit']; $zip=Join-Path $Directory ($prefix+'.zip'); $manifestPath=Join-Path $Directory ($prefix+'.sha256'); $metadata=Read-AttJson (Join-Path $Directory ($prefix+'.metadata.json'))
    foreach($field in @('repository','commit','git_object_format')) { [void](Assert-AttText $metadata[$field]) }
    if ((Assert-AttInteger $metadata['schema']) -ne 2 -or $metadata['repository'] -cne $script:AttRepository -or $metadata['commit'] -cne $Identity['commit'] -or $metadata['git_object_format'] -cne $Identity['object_format']) { throw 'Schema 2 exact source identity required' }
    Assert-AttFile $manifestPath 8388608; Assert-AttFile $zip; Assert-AttDescriptor $metadata['archive'] $zip ($prefix+'.zip'); Assert-AttDescriptor $metadata['manifest'] $manifestPath ($prefix+'.sha256')
    $manifest=Read-AttManifest $manifestPath; $files=$metadata['files']; Assert-AttMap $files; if (((Get-AttKeys $manifest) -join "`n") -cne ((Get-AttKeys $files) -join "`n")) { throw 'Manifest and metadata sets differ' }
    $total=[long]0; foreach($name in (Get-AttKeys $files)) { Assert-AttMap $files[$name]; $size=Assert-AttInteger $files[$name]['size']; $digest=Assert-AttText $files[$name]['sha256']; if ($size -lt 0 -or $size -gt 134217728 -or $size -gt 1073741824-$total -or $digest -cne $manifest[$name] -or [IO.Path]::GetExtension($name).ToLowerInvariant() -notin @('.lua','.xml')) { throw 'Metadata file size/hash/type limit' }; $total+=$size }
    $products=$metadata['products']; if ($products -isnot [Array] -or -not $products.Count) { throw 'Explicit products required' }; $seen=New-Object 'System.Collections.Generic.HashSet[string]' ([StringComparer]::Ordinal); $union=New-Object 'System.Collections.Generic.HashSet[string]' ([StringComparer]::Ordinal); $selected=$null
    foreach($p in $products) {
        Assert-AttMap $p; foreach($field in @('flavor','profile','recipe')) { [void](Assert-AttToken $p[$field]) }; [void](Assert-AttText $p['root']); if (-not $script:AttRoots.ContainsKey($p['flavor']) -or $p['root'] -cne $script:AttRoots[$p['flavor']] -or -not $seen.Add($p['flavor']) -or $p['files'] -isnot [Array] -or -not $p['files'].Count) { throw 'Product identity/root/list invalid' }; foreach($item in $p['files']) { [void](Assert-AttText $item) }
        $sorted=[string[]]@($p['files']); [Array]::Sort($sorted,[StringComparer]::Ordinal); if (($sorted -join "`n") -cne ($p['files'] -join "`n")) { throw 'Product file list must be ordinally sorted' }
        Assert-AttPathSet ([string[]]$p['files']); foreach($path in $p['files']) { if (-not $files.ContainsKey($path)) { throw 'Product path absent from file manifest' }; [void]$union.Add($path) }; foreach($path in $files.Keys) { if ($path.StartsWith($p['root']+'/',[StringComparison]::Ordinal) -and $p['files'] -cnotcontains $path) { throw 'Incomplete own product root' } }
        foreach($required in @('ReferenceDB.lua','LocalizationDB.lua','Database.xml')) { $path=$p['root']+'/'+$required; if (-not $files.ContainsKey($path) -or $files[$path]['size'] -le 0) { throw 'Product required file missing/empty' } }
        if ($p['flavor'] -ceq $Identity['flavor'] -and $p['profile'] -ceq $Identity['profile'] -and $p['recipe'] -ceq $Identity['recipe']) { $selected=$p }
    }; if (-not $selected -or -not $union.SetEquals([string[]]@($files.Keys))) { throw 'Requested product/complete union mismatch' }
    if ($seen.Contains('era') -and -not $seen.Contains('sod')) { throw 'Era requires declared SoD product identity' }; $declaredRoots=[string[]]@($products | ForEach-Object {$_['root']}); foreach($name in $files.Keys) { if ($declaredRoots -cnotcontains $name.Split('/')[0]) { throw 'File belongs to undeclared DB root' } }
    $producer=$metadata['producer']; Assert-AttMap $producer; if ($producer['fresh_staging'] -isnot [bool] -or -not $producer['fresh_staging']) { throw 'Fresh staging attestation required' }; foreach($field in @('required_flavors','completed_flavors')) { if ($producer[$field] -isnot [Array] -or $producer[$field].Count -ne $seen.Count) { throw 'Product completion mismatch' }; $set=New-Object 'System.Collections.Generic.HashSet[string]' ([StringComparer]::Ordinal); foreach($f in $producer[$field]) { if ($f -isnot [string] -or -not $set.Add($f)) { throw 'Duplicate/invalid completion flavor' } }; if (-not $set.SetEquals($seen)) { throw 'Incomplete producer completion' } }
    $central=Read-AttZipHeaders $zip; if ($central.Count -ne $files.Count) { throw 'ZIP manifest entry count mismatch' }
    [void][IO.Directory]::CreateDirectory($Output); $stream=[IO.File]::OpenRead($zip); $archive=New-Object IO.Compression.ZipArchive($stream,[IO.Compression.ZipArchiveMode]::Read,$false)
    try {
        if ($archive.Entries.Count -ne $central.Count) { throw 'ZIP decoder/header mismatch' }
        for($i=0;$i -lt $central.Count;$i++) {
            $entry=$archive.Entries[$i]; $raw=$central[$i]; $name=$raw.name
            if ($entry.FullName -cne $name -or $entry.Length -ne $raw.size -or $entry.CompressedLength -ne $raw.compressed -or -not $files.ContainsKey($name) -or $files[$name]['size'] -ne $entry.Length) { throw 'ZIP identity/size mismatch' }
            $targetPath=Join-Path $Output $name; [void][IO.Directory]::CreateDirectory([IO.Path]::GetDirectoryName($targetPath)); [void](Assert-AttNoLinks $targetPath); $input=$entry.Open(); $out=New-Object IO.FileStream($targetPath,[IO.FileMode]::CreateNew,[IO.FileAccess]::Write,[IO.FileShare]::None); $buffer=New-Object byte[] 65536; $written=[long]0
            try { while(($n=$input.Read($buffer,0,$buffer.Length)) -gt 0) { if ($n -gt $raw.size-$written) { throw 'ZIP expanded entry exceeds declared size' }; $out.Write($buffer,0,$n); $written+=$n }; if ($written -ne $raw.size) { throw 'ZIP expanded length mismatch' }; $out.Flush($true) } finally { $out.Dispose(); $input.Dispose() }
            if ((Get-AttFileHash $targetPath) -cne $manifest[$name]) { throw 'Extracted file hash mismatch' }
        }
        foreach($p in $products) { $closure=New-Object 'System.Collections.Generic.HashSet[string]' ([StringComparer]::Ordinal); foreach($name in $files.Keys) { if ($name.StartsWith($p['root']+'/',[StringComparison]::Ordinal)) { [void]$closure.Add($name) } }; foreach($name in @($closure)) { if ($name.EndsWith('.xml',[StringComparison]::OrdinalIgnoreCase)) { $closure.UnionWith([string[]](Get-AttXmlClosure $Output $name $files)) } }; if (-not $closure.SetEquals([string[]]$p['files'])) { throw 'Product XML closure mismatch' } }
        return ,@{metadata=$metadata; product=$selected; manifest=$manifest; extracted=$Output}
    } finally { $archive.Dispose(); $stream.Dispose() }
}
function Assert-AttHttps([Uri]$Uri) {
    if (-not $Uri.IsAbsoluteUri -or $Uri.Scheme -cne 'https' -or $Uri.UserInfo -or -not $Uri.IsDefaultPort -or $Uri.Fragment -or $Uri.IdnHost.ToLowerInvariant() -notin @('github.com','objects.githubusercontent.com','release-assets.githubusercontent.com')) { throw 'HTTPS release URL outside allowlist' }
}
function Get-AttHttpsFile([string]$Url,[string]$Path,[long]$Limit) {
    $uri=New-Object Uri($Url); $handler=New-Object Net.Http.HttpClientHandler; $handler.AllowAutoRedirect=$false; $handler.UseCookies=$false; $handler.UseProxy=$false; $handler.UseDefaultCredentials=$false; $handler.SslProtocols=[Security.Authentication.SslProtocols]::Tls12; $client=New-Object Net.Http.HttpClient($handler); $client.Timeout=[TimeSpan]::FromSeconds(30); [void]$client.DefaultRequestHeaders.UserAgent.ParseAdd('ATT-script-deployment/1')
    try { for($hop=0;$hop -le 5;$hop++) { Assert-AttHttps $uri; $response=$client.GetAsync($uri,[Net.Http.HttpCompletionOption]::ResponseHeadersRead).GetAwaiter().GetResult()
        try {
            $status=[int]$response.StatusCode; if ($status -in @(301,302,303,307,308)) { if ($hop -eq 5 -or -not $response.Headers.Location) { throw 'Redirect cap/missing Location' }; $uri=New-Object Uri($uri,$response.Headers.Location); continue }
            if ($status -ne 200) { throw ('Release download HTTP '+$status) }; if ($response.Content.Headers.ContentLength -and $response.Content.Headers.ContentLength -gt $Limit) { throw 'HTTP length limit' }
            $input=$response.Content.ReadAsStreamAsync().GetAwaiter().GetResult(); [void](Assert-AttNoLinks $Path); $output=New-Object IO.FileStream($Path,[IO.FileMode]::CreateNew,[IO.FileAccess]::Write,[IO.FileShare]::None); $clock=[Diagnostics.Stopwatch]::StartNew(); $buffer=New-Object byte[] 65536; $total=[long]0
            try { while($true) { $remaining=30000-[int]$clock.ElapsedMilliseconds; if ($remaining -le 0) { throw 'HTTP body timeout' }; $task=$input.ReadAsync($buffer,0,$buffer.Length); if (-not $task.Wait($remaining)) { throw 'HTTP body timeout' }; $n=$task.Result; if (-not $n) { break }; if ($n -gt $Limit-$total) { throw 'HTTP body size limit' }; $output.Write($buffer,0,$n); $total+=$n }; $output.Flush($true) } finally { $output.Dispose(); $input.Dispose() }; return
        } finally { $response.Dispose() }
    } } finally { $client.Dispose(); $handler.Dispose() }
}

function Assert-AttSourceClean([string]$SourcePath) {
    # Stronger than a normal status: hidden index changes and ignored files refuse.
    $index=Invoke-AttGit $SourcePath @('ls-files','-v','-z')
    foreach($row in $index.Split([char]0)) { if ($row.Length -gt 2 -and ($row[0] -eq 'S' -or [char]::IsLower($row[0]))) { throw 'Index assume-unchanged/skip-worktree flags must be resolved before preparing' } }
    if ((Invoke-AttGit $SourcePath @('status','--porcelain=v1','-z','--untracked-files=all','--ignored=matching')).Length) { throw 'Source contains local/untracked/ignored changes; all content is preserved' }
}
function Test-AttRuntimePath([string]$Path,[switch]$IncludeDb) {
    return ($Path -cmatch '^(?:[^/]+\.(?:toc|lua|xml|blp|tga|png|jpg|jpeg|gif|ogg|mp3|wav)|(?:src|locales|assets|lib)/.+|LICENSE|license\.txt)$' -or ($IncludeDb -and $Path.StartsWith('db/',[StringComparison]::Ordinal)))
}
function Resolve-AttRuntimeReference([string]$From,[string]$Raw,[string]$GameRoot) {
    $raw=$Raw.Replace('\','/').Replace('[Game]',$GameRoot)
    if (-not $raw -or $raw.StartsWith('/') -or $raw.Contains(':') -or $raw.Contains('[') -or $raw.Contains(']') -or $raw -match '[\x00-\x1f\x7f]') { throw 'Unsafe/unsupported runtime reference' }
    $parts=New-Object 'System.Collections.Generic.List[string]'; if ($From) { $segments=$From.Split('/'); for($i=0;$i -lt $segments.Length-1;$i++) { $parts.Add($segments[$i]) } }
    foreach($part in $raw.Split('/')) { if (-not $part -or $part -eq '.') { continue }; if ($part -eq '..') { if (-not $parts.Count) { throw 'Runtime reference escapes AddOn' }; $parts.RemoveAt($parts.Count-1) } else { $parts.Add($part) } }
    $path=Assert-AttSafePath ($parts -join '/'); if (-not (Test-AttRuntimePath $path -IncludeDb)) { throw 'Runtime reference outside allowlist' }; return $path
}
function Test-AttSnapshotClosure([string]$Addon,[string]$GameRoot,$Files) {
    $visited=New-Object 'System.Collections.Generic.HashSet[string]' ([StringComparer]::Ordinal); $active=New-Object 'System.Collections.Generic.HashSet[string]' ([StringComparer]::Ordinal)
    function Visit-AttRuntime([string]$Name) {
        if (-not $Files.ContainsKey($Name)) { throw ('Missing runtime reference: '+$Name) }; if ($active.Contains($Name)) { throw 'Cyclic runtime XML include' }; if (-not $visited.Add($Name) -or -not $Name.EndsWith('.xml',[StringComparison]::OrdinalIgnoreCase)) { return }; [void]$active.Add($Name)
        $path=Join-Path $Addon $Name; Assert-AttFile $path 134217728; $data=[IO.File]::ReadAllBytes($path); $text=$script:AttUtf8.GetString($data); if ($text.IndexOf([char]0) -ge 0 -or $text -match '<!(?:DOCTYPE|ENTITY)') { throw 'External XML declarations refused' }
        $settings=New-Object Xml.XmlReaderSettings; $settings.DtdProcessing=[Xml.DtdProcessing]::Prohibit; $settings.XmlResolver=$null; $reader=[Xml.XmlReader]::Create($path,$settings); $doc=New-Object Xml.XmlDocument; $doc.XmlResolver=$null
        try { $doc.Load($reader) } finally { $reader.Dispose() }
        if ($Name.StartsWith('db/',[StringComparison]::Ordinal) -and $Name.EndsWith('/Database.xml',[StringComparison]::Ordinal)) {
            $first=@($doc.DocumentElement.ChildNodes | Where-Object {$_.NodeType -eq [Xml.XmlNodeType]::Element} | Select-Object -First 1); if ($first.Count -ne 1 -or $first[0].LocalName -cne 'Script' -or (Resolve-AttRuntimeReference $Name $first[0].GetAttribute('file') $GameRoot) -cne ($Name.Substring(0,$Name.LastIndexOf('/'))+'/LocalizationDB.lua')) { throw 'Database.xml must load LocalizationDB first' }
        }
        foreach($element in $doc.SelectNodes('//*')) { if ($element.LocalName -in @('Script','Include')) { $raw=$element.GetAttribute('file'); if ($raw) { Visit-AttRuntime (Resolve-AttRuntimeReference $Name $raw $GameRoot) } elseif ($element.LocalName -eq 'Include') { throw 'XML Include lacks file' } } }; [void]$active.Remove($Name)
    }
    foreach($toc in @($Files.Keys | Where-Object { -not $_.Contains('/') -and $_.EndsWith('.toc',[StringComparison]::OrdinalIgnoreCase) })) { $text=$script:AttUtf8.GetString([IO.File]::ReadAllBytes((Join-Path $Addon $toc))).TrimStart([char]0xFEFF); foreach($line in $text.Replace("`r`n","`n").Replace("`r","`n").Split("`n")) { $value=$line.Trim(); if ($value -and -not $value.StartsWith('#')) { Visit-AttRuntime (Resolve-AttRuntimeReference '' $value $GameRoot) } } }
    foreach($required in @('Bindings.xml',('db/'+$GameRoot+'/ReferenceDB.lua'),('db/'+$GameRoot+'/Database.xml'))) { Visit-AttRuntime $required }
}
function Export-AttRuntimeSource([string]$SourcePath,[string]$Oid,[string]$Addon) {
    $tree=Invoke-AttGit $SourcePath @('ls-tree','-rz',$Oid); $export=New-AttMap
    foreach($row in $tree.Split([char]0)) { if (-not $row) { continue }; if ($row -cnotmatch '^([0-9]{6}) (?:blob|commit) ([0-9a-f]+)\t(.+)$') { throw 'Unsupported Git source tree object' }; $mode=$Matches[1]; $oidValue=$Matches[2]; $path=$Matches[3]; if (-not (Test-AttRuntimePath $path)) { continue }; if ($mode -notin @('100644','100755')) { throw 'Linked/submodule runtime source refused' }; [void](Assert-AttSafePath $path); $export.Add($path,@{oid=$oidValue;mode=$mode}) }
    foreach($required in @('AllTheThings.toc','AllTheThings.lua','Bindings.xml')) { if (-not $export.ContainsKey($required)) { throw 'Required ATT source runtime file missing' } }; Assert-AttPathSet ([string[]]@($export.Keys))
    Export-AttGitBlobs $SourcePath ((Invoke-AttGit $SourcePath @('rev-parse','--show-object-format')).Trim()) $export $Addon
}
function New-AttSourceSnapshot([string]$SourcePath,[string]$Addon,$Verified,$Identity) {
    Assert-AttSourceClean $SourcePath; Export-AttRuntimeSource $SourcePath $Identity['commit'] $Addon
    foreach($path in $Verified.product['files']) { $targetPath=Join-Path $Addon ('db/'+$path); [void][IO.Directory]::CreateDirectory([IO.Path]::GetDirectoryName($targetPath)); $inputPath=Join-Path $Verified.extracted $path; Assert-AttFile $inputPath 134217728; $bytes=[IO.File]::ReadAllBytes($inputPath); if ((Get-AttHash $bytes) -cne $Verified.manifest[$path]) { throw 'Product changed after artifact verification' }; Write-AttNew $targetPath $bytes }
    $toc=Join-Path $Addon 'AllTheThings.toc'; $text=$script:AttUtf8.GetString([IO.File]::ReadAllBytes($toc)); if ($text -match '(?m)^\s*## X-ATT(?:SourceSHA|ObjectFormat|Flavor|Profile|Recipe):') { throw 'Source already has managed metadata' }
    $extra="`n## X-ATTSourceSHA: "+$Identity['commit']+"`n## X-ATTObjectFormat: "+$Identity['object_format']+"`n## X-ATTFlavor: "+$Identity['flavor']+"`n## X-ATTProfile: "+$Identity['profile']+"`n## X-ATTRecipe: "+$Identity['recipe']+"`n"; $append=New-Object IO.FileStream($toc,[IO.FileMode]::Append,[IO.FileAccess]::Write,[IO.FileShare]::None); try { $data=$script:AttUtf8.GetBytes($extra); $append.Write($data,0,$data.Length); $append.Flush($true) } finally { $append.Dispose() }
    $inventory=Get-AttInventory $Addon; Test-AttSnapshotClosure $Addon $Verified.product['root'] $inventory; $snapshot=Get-AttHash ($script:AttUtf8.GetBytes((ConvertTo-AttCanonical @{identity=$Identity;files=$inventory})))
    [void][IO.Directory]::CreateDirectory((Join-Path $Addon '.att-managed')); Write-AttJsonNew (Join-Path $Addon '.att-managed/manifest.json') @{schema_version=1;identity=$Identity;files=$inventory;product_root=$Verified.product['root'];snapshot_id=$snapshot;protocol='att-script-powershell-v1'}
    Assert-AttSourceClean $SourcePath; return $snapshot
}
function Invoke-AttPrepare {
    if ([Environment]::OSVersion.Platform -ne [PlatformID]::Win32NT) { throw 'Windows preparation requires Windows; activation is unsupported' }
    foreach($value in @($Source,$Store,$Target)) { if (-not $value -or -not [IO.Path]::IsPathRooted($value)) { throw 'Absolute source/store/target required' } }
    # All Windows separate-path callers support physical local NTFS volumes and
    # actual long directory names only. Custom short aliases need not contain ~.
    Assert-AttSeparate @($Source,$Store,$Target); $sourcePath=Assert-AttNoLinks $Source; $storePath=Assert-AttNoLinks $Store; $targetPath=Assert-AttNoLinks $Target
    Assert-AttSourceClean $sourcePath
    $oid=(Invoke-AttGit $sourcePath @('rev-parse','HEAD')).Trim(); $format=(Invoke-AttGit $sourcePath @('rev-parse','--show-object-format')).Trim(); [void](Assert-AttOid $oid $format); foreach($token in @($Flavor,$Profile,$Recipe)) { [void](Assert-AttToken $token) }
    $identity=@{commit=$oid;object_format=$format;flavor=$Flavor;profile=$Profile;recipe=$Recipe}; $owner=@{schema=1;source=$sourcePath;store=$storePath;target=$targetPath;platform='windows-preparation-v1'}
    $mutexName='Global\ATT-script-'+(Get-AttHash ($script:AttUtf8.GetBytes($storePath.ToUpperInvariant()))); $mutex=New-Object Threading.Mutex($false,$mutexName); $locked=$false
    try { try { $locked=$mutex.WaitOne(15000) } catch [Threading.AbandonedMutexException] { $locked=$true }; if (-not $locked) { throw 'Store is locked' }
        if ([IO.File]::Exists($storePath)) { throw 'Store is a file' }; $ownerPath=Join-Path $storePath 'owner.json'
        if ([IO.Directory]::Exists($storePath) -and -not [IO.File]::Exists($ownerPath) -and @([IO.Directory]::EnumerateFileSystemEntries($storePath)).Count) { throw 'Nonempty unmanaged store refused' }
        [void][IO.Directory]::CreateDirectory($storePath); if ([IO.File]::Exists($ownerPath)) { if ((ConvertTo-AttCanonical (Read-AttJson $ownerPath)) -cne (ConvertTo-AttCanonical $owner)) { throw 'Store ownership mismatch' } } else { Write-AttJsonNew $ownerPath $owner }
        foreach($dir in @('cache','staging','generations')) { [void][IO.Directory]::CreateDirectory((Join-Path $storePath $dir)) }
        $journalPath=Join-Path $storePath 'prepare-journal.json'; if ([IO.File]::Exists($journalPath)) { $old=Read-AttJson $journalPath; if ($old['state'] -notin @('preparing','prepared','interrupted')) { throw 'Unknown preparation journal' }; $old['state']='interrupted'; Write-AttJsonAtomic $journalPath $old }
        $key=Get-AttHash ($script:AttUtf8.GetBytes((ConvertTo-AttCanonical $identity))); $cache=Join-Path $storePath ('cache/'+$key); $stage=Join-Path $storePath ('staging/'+[guid]::NewGuid().ToString('N')); [void][IO.Directory]::CreateDirectory($stage); Write-AttJsonAtomic $journalPath @{state='preparing';identity=$identity;stage=$stage}
        $prefix='db-'+$format+'-'+$oid; if (-not [IO.Directory]::Exists($cache)) {
            if ($Offline) { throw 'Exact verified cache is unavailable offline' }; $download=Join-Path $stage 'download'; [void][IO.Directory]::CreateDirectory($download)
            foreach($pair in @(@('.zip',536870912),@('.sha256',8388608),@('.metadata.json',4194304))) { Get-AttHttpsFile ('https://github.com/'+$script:AttRepository+'/releases/download/db-artifacts/'+$prefix+$pair[0]) (Join-Path $download ($prefix+$pair[0])) $pair[1] }
            # Cache publication happens only after full validation; cache use revalidates bytes.
            [void](Test-AttBundle $download (Join-Path $stage 'cache-check') $identity); Write-AttJsonNew (Join-Path $download 'receipt.json') @{identity=$identity;metadata_sha256=(Get-AttFileHash (Join-Path $download ($prefix+'.metadata.json')))}; [IO.Directory]::Move($download,$cache)
        }
        $receipt=Read-AttJson (Join-Path $cache 'receipt.json'); $receiptHash=Assert-AttText $receipt['metadata_sha256']; if ((ConvertTo-AttCanonical $receipt['identity']) -cne (ConvertTo-AttCanonical $identity) -or $receiptHash -cnotmatch '^[0-9a-f]{64}$' -or $receiptHash -cne (Get-AttFileHash (Join-Path $cache ($prefix+'.metadata.json')))) { throw 'Cache receipt mismatch' }
        $verified=Test-AttBundle $cache (Join-Path $stage 'verified-db') $identity; $addon=Join-Path $stage 'addon'; $snapshot=New-AttSourceSnapshot $sourcePath $addon $verified $identity
        if ((Invoke-AttGit $sourcePath @('rev-parse','HEAD')).Trim() -cne $oid) { throw 'Source changed during preparation' }; Assert-AttSourceClean $sourcePath
        $generation=Join-Path $storePath ('generations/'+$snapshot); if ([IO.Directory]::Exists($generation)) { throw 'Generation already exists; retained without overwrite' }; [IO.Directory]::Move($addon,$generation)
        Write-AttJsonAtomic $journalPath @{state='prepared';identity=$identity;generation=$generation;snapshot_id=$snapshot;activation_supported=$false}
        return @{state='prepared';identity=$identity;generation=$generation;snapshot_id=$snapshot;activation_supported=$false;target_unchanged=$true}
    } finally { if ($locked) { $mutex.ReleaseMutex() }; $mutex.Dispose() }
}
function Invoke-AttSelfTest {
    $names=New-Object 'System.Collections.Generic.List[string]'
    function Pass-Att([string]$Name,[scriptblock]$Test) { & $Test; $names.Add($Name) }
    function Reject-Att([scriptblock]$Test) { $failed=$false; try { & $Test | Out-Null } catch { $failed=$true }; if (-not $failed) { throw 'Expected fixture refusal' } }
    Pass-Att 'duplicate-json-keys' { Reject-Att { ConvertFrom-AttJson '{"x":1,"\u0078":2}' } }
    Pass-Att 'nested-duplicate-json' { Reject-Att { ConvertFrom-AttJson '{"a":[{"x":1,"x":2}]}' } }
    Pass-Att 'json-trailing-input' { Reject-Att { ConvertFrom-AttJson '{} true' } }
    Pass-Att 'strict-json-values' { $v=ConvertFrom-AttJson '{"x":[true,false,null,1,"\ud83d\ude00"]}'; if ($v['x'].Count -ne 5 -or $v['x'][3] -ne 1) { throw 'JSON fixture mismatch' } }
    Pass-Att 'json-contract-type-coercion-refused' { Reject-Att { Assert-AttText $true }; Reject-Att { Assert-AttInteger $true }; Reject-Att { Assert-AttInteger '2' }; Reject-Att { Assert-AttToken 1 } }
    Pass-Att 'unsafe-paths' { foreach($p in @('../x','A/../../x','A\x','CON.lua','a./x','a/x:stream')) { Reject-Att { Assert-AttSafePath $p } } }
    Pass-Att 'case-and-prefix-collisions' { Reject-Att { Assert-AttPathSet @('A/x.lua','a/y.lua') }; Reject-Att { Assert-AttPathSet @('A','A/x.lua') } }
    Pass-Att 'source-identity' { Reject-Att { Assert-AttOid ('a'*40) 'sha256' }; if ((Assert-AttOid ('a'*40) 'sha1') -cne ('a'*40)) { throw 'OID mismatch' } }
    Pass-Att 'https-redirect-policy' { foreach($u in @('http://github.com/a','https://evil.example/a','https://user@github.com/a','https://github.com:444/a')) { Reject-Att { Assert-AttHttps ([Uri]$u) } } }
    $fixture=Join-Path ([IO.Path]::GetTempPath()) ('att-ps-git-test-'+[guid]::NewGuid().ToString('N')); [void][IO.Directory]::CreateDirectory($fixture)
    try {
        # Independent ZIP headers for one empty regular file, unsigned/signed
        # descriptors respectively. Header-only ratio fixture has 201:1 sizes.
        $zipFixtures=@('UEsDBBQACAAAAAAAAAAAAAAAAAAAAAAAAAAOAAAAU3RhbmRhcmQveC5sdWEAAAAAAAAAAAAAAABQSwECFAAUAAgAAAAAAAAAAAAAAAAAAAAAAAAADgAAAAAAAAAAAAAAAAAAAAAAU3RhbmRhcmQveC5sdWFQSwUGAAAAAAEAAQA8AAAAOAAAAAAA','UEsDBBQACAAAAAAAAAAAAAAAAAAAAAAAAAAOAAAAU3RhbmRhcmQveC5sdWFQSwcIAAAAAAAAAAAAAAAAUEsBAhQAFAAIAAAAAAAAAAAAAAAAAAAAAAAAAA4AAAAAAAAAAAAAAAAAAAAAAFN0YW5kYXJkL3gubHVhUEsFBgAAAAABAAEAPAAAADwAAAAAAA==')
        Pass-Att 'zip-signed-and-unsigned-descriptors' { for($i=0;$i -lt $zipFixtures.Count;$i++) { $path=Join-Path $fixture ('descriptor-'+$i+'.zip'); Write-AttNew $path ([Convert]::FromBase64String($zipFixtures[$i])); $headers=Read-AttZipHeaders $path; if ($headers.Count -ne 1 -or $headers[0]['name'] -cne 'Standard/x.lua') { throw 'Descriptor fixture mismatch' } } }
        Pass-Att 'zip-descriptor-central-crc-mismatch-refused' { $bytes=[Convert]::FromBase64String($zipFixtures[1]); $bytes[48]=1; $path=Join-Path $fixture 'descriptor-bad.zip'; Write-AttNew $path $bytes; Reject-Att { Read-AttZipHeaders $path } }
        Pass-Att 'zip-small-member-ratio-limit' { $bytes=[Convert]::FromBase64String('UEsDBBQACAAIAAAAAAAAAAAAAAAAAAAAAAAOAAAAU3RhbmRhcmQveC5sdWFYAAAAAAEAAADJAAAAUEsBAhQAFAAIAAgAAAAAAAAAAAABAAAAyQAAAA4AAAAAAAAAAAAAAAAAAAAAAFN0YW5kYXJkL3gubHVhUEsFBgAAAAABAAEAPAAAADkAAAAAAA=='); $path=Join-Path $fixture 'small-ratio.zip'; Write-AttNew $path $bytes; Reject-Att { Read-AttZipHeaders $path } }
        [void](Invoke-AttGit $fixture @('init','-q','--template=')); Write-AttNew (Join-Path $fixture '.gitattributes') ($script:AttUtf8.GetBytes(".contrib export-ignore`n*.txt export-subst`n")); $body=$script:AttUtf8.GetBytes('raw $Format:%H$ bytes'+[char]0+'tail')
        $oid=(Invoke-AttGit $fixture @('hash-object','-w','--stdin') -InputData $body).Trim(); $format=(Invoke-AttGit $fixture @('rev-parse','--show-object-format')).Trim(); $expected=New-AttMap; $expected.Add('.contrib/bytes.txt',@{oid=$oid;mode='100644'})
        Pass-Att 'git-batch-exact-blob-despite-export-attributes' {
            Export-AttGitBlobs $fixture $format $expected (Join-Path $fixture 'export')
            if ((Get-AttFileHash (Join-Path $fixture 'export/.contrib/bytes.txt')) -cne (Get-AttHash $body)) { throw 'Raw Git bytes changed' }
        }
        Pass-Att 'git-batch-existing-output-not-overwritten' { Reject-Att { Export-AttGitBlobs $fixture $format $expected (Join-Path $fixture 'export') }; if ((Get-AttFileHash (Join-Path $fixture 'export/.contrib/bytes.txt')) -cne (Get-AttHash $body)) { throw 'Existing bytes lost' } }
    } finally { [void](Assert-AttNoLinks $fixture); [IO.Directory]::Delete($fixture,$true) }
    return @{tests=$names.Count;passed=$names.Count;names=$names.ToArray();scope='helper fixtures; not Windows activation or real network acceptance'}
}
if ($LibraryOnly) { return }
try {
    $result=$null
    switch($Command) {
        'activate' { throw 'Windows activation is unsupported and refused; target is unchanged' }
        'prepare' { $result=Invoke-AttPrepare }
        'verify' { $result=Test-AttBundle $Bundle $Destination @{commit=$Commit;object_format=$ObjectFormat;flavor=$Flavor;profile=$Profile;recipe=$Recipe}; $result=@{verified=$true;identity=@{commit=$Commit;object_format=$ObjectFormat;flavor=$Flavor;profile=$Profile;recipe=$Recipe};product_root=$result.product['root']} }
        'selftest' { $result=Invoke-AttSelfTest }
    }; ConvertTo-Json -InputObject $result -Depth 100
} catch { Write-Error $_; exit 1 }
