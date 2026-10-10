# Custom New CD commands use PowerShell scripts and existing OS/runner assemblies.
# Parser remains the repository's net48 executable, on Windows only.
[CmdletBinding()]
param(
    [ValidateSet('collect','build','publish','producer-init','producer-complete','producer-package','selftest')][string]$Command,
    [string]$Source, [string]$ToolsSource, [string]$Stage, [string]$OutputDirectory,
    [string]$ExpectedSha, [string]$ToolsSha, [string]$SourceRef,
    [ValidateSet(7,30)][int]$RetentionDays = 7,
    [ValidateSet('true','false')][string]$Publish = 'false',
    [string]$Bundles, [string]$ExpectedCommitsJson, [string]$TargetSha,
    [string]$Repository = 'ATTWoWAddon/AllTheThings', [string]$Contract,
    [string]$Flavor, [switch]$GeneratorSucceeded, [switch]$PlanOnly,
    [switch]$LibraryOnly
)
Set-StrictMode -Version 2
$ErrorActionPreference='Stop'
$attNewCdArguments=@{Command=$Command;Source=$Source;Flavor=$Flavor;LibraryOnly=$LibraryOnly}
. (Join-Path $PSScriptRoot 'att-deploy.ps1') -LibraryOnly
foreach($attNewCdKey in $attNewCdArguments.Keys) { Set-Variable -Name $attNewCdKey -Value $attNewCdArguments[$attNewCdKey] }
$script:AttRecipe='new-cd-auto-v1'
$script:AttParser='.contrib/.tools/Parser.exe'
$script:AttBaseConfig='.contrib/.db/standard/.config/retail/retail.config'
$script:AttConfigs=[ordered]@{
    retail=$null
    era='.contrib/.db/standard/.config/classic/01 - Classic Era.config'
    sod='.contrib/.db/standard/.config/classic/01 - Classic SOD.config'
    tbc='.contrib/.db/standard/.config/classic/02 - TBC.config'
    wrath='.contrib/.db/standard/.config/classic/03 - Wrath.config'
    cata='.contrib/.db/standard/.config/classic/04 - Cataclysm.config'
    mists='.contrib/.db/standard/.config/classic/05 - Mists of Pandaria.config'
    forever='.contrib/.db/forever/.config/forever.config'
}
function Get-AttInputPaths { return ,([string[]]@(@($script:AttParser,$script:AttBaseConfig)+@($script:AttConfigs.Values | Where-Object {$null -ne $_}) | Sort-Object)) }
function Test-AttContract($Value) {
    Assert-AttMap $Value
    foreach($field in @('repository','commit','git_object_format')) { [void](Assert-AttText $Value[$field]) }
    if ($Value['git_object_format'] -cnotin @('sha1','sha256')) { throw 'Explicit Git object format required' }
    if ((Assert-AttInteger $Value['schema']) -ne 2 -or $Value['repository'] -cne $script:AttRepository) { throw 'Canonical schema 2 producer contract required' }
    [void](Assert-AttOid $Value['commit'] $Value['git_object_format']); $products=$Value['products']; if ($products -isnot [Array] -or -not $products.Count) { throw 'Nonempty explicit product contract required' }
    $seen=New-Object 'System.Collections.Generic.HashSet[string]' ([StringComparer]::Ordinal); $out=New-Object 'System.Collections.Generic.List[object]'
    foreach($product in $products) {
        Assert-AttMap $product; foreach($field in @('flavor','profile','recipe')) { [void](Assert-AttToken $product[$field]) }; [void](Assert-AttText $product['root'])
        if (-not $script:AttRoots.ContainsKey($product['flavor']) -or -not $seen.Add($product['flavor']) -or $product['root'] -cne $script:AttRoots[$product['flavor']]) { throw 'Unknown/duplicate/mismatched product flavor root' }
        $out.Add(@{flavor=$product['flavor'];root=$product['root'];profile=$product['profile'];recipe=$product['recipe']})
    }; if ($seen.Contains('era') -and -not $seen.Contains('sod')) { throw 'Era generation requires explicit SoD product' }
    return ,@{schema=2;repository=$Value['repository'];commit=$Value['commit'];git_object_format=$Value['git_object_format'];products=$out.ToArray()}
}
function New-AttNewCdContract([string]$Oid,[string]$Format) {
    $products=@(); foreach($flavor in $script:AttConfigs.Keys) { $products+=@{flavor=$flavor;root=$script:AttRoots[$flavor];profile=('new-cd-'+$flavor+'-auto');recipe=$script:AttRecipe} }
    return Test-AttContract @{schema=2;repository=$script:AttRepository;commit=$Oid;git_object_format=$Format;products=$products}
}
function Assert-AttEmptyDirectory([string]$Path) {
    [void](Assert-AttNoLinks $Path); if ([IO.File]::Exists($Path) -or ([IO.Directory]::Exists($Path) -and @([IO.Directory]::EnumerateFileSystemEntries($Path)).Count)) { throw 'New or empty directory required; existing content is preserved' }; [void][IO.Directory]::CreateDirectory($Path)
}
function Initialize-AttProducer([string]$Path,$Value) {
    $validated=Test-AttContract $Value; Assert-AttEmptyDirectory $Path
    $receipt=@{contract=$validated;fresh_staging=$true;stage_id=[guid]::NewGuid().ToString('N');started_at=[DateTimeOffset]::UtcNow.ToString('o');completed=(New-AttMap)}
    Write-AttJsonNew (Join-Path $Path '.att-producer.json') $receipt; [void][IO.Directory]::CreateDirectory((Join-Path $Path 'db')); [void][IO.Directory]::CreateDirectory((Join-Path $Path '.contrib/.db/shared/constants')); return ,$receipt
}
function Read-AttProducerReceipt([string]$Path) {
    [void](Assert-AttNoLinks $Path); $receipt=Read-AttJson (Join-Path $Path '.att-producer.json')
    if ($receipt['fresh_staging'] -isnot [bool] -or -not $receipt['fresh_staging'] -or $receipt['stage_id'] -cnotmatch '^[0-9a-f]{32}$') { throw 'Fresh producer receipt missing' }; Assert-AttMap $receipt['completed']; $receipt['contract']=Test-AttContract $receipt['contract']
    foreach($entry in [IO.Directory]::EnumerateFileSystemEntries($Path)) { [void](Assert-AttNoLinks $entry); if ([IO.Path]::GetFileName($entry) -notin @('.att-producer.json','db','.contrib')) { throw 'Unexpected content outside producer stage roots' } }
    return ,$receipt
}
function Get-AttOwnedFiles($Files,[string]$Root) { $own=New-AttMap; foreach($name in (Get-AttKeys $Files)) { if ($name.StartsWith($Root+'/',[StringComparison]::Ordinal)) { $own.Add($name,$Files[$name]) } }; foreach($required in @('ReferenceDB.lua','LocalizationDB.lua','Database.xml')) { if (-not $own.ContainsKey($Root+'/'+$required) -or $own[$Root+'/'+$required]['size'] -le 0) { throw 'Required generated product file missing' } }; return ,$own }
function Complete-AttProducer([string]$Path,[string]$Name) {
    $receipt=Read-AttProducerReceipt $Path; $product=@($receipt['contract']['products'] | Where-Object {$_['flavor'] -ceq $Name}); if ($product.Count -ne 1 -or $receipt['completed'].ContainsKey($Name)) { throw 'Flavor absent/already completed; use fresh generation' }
    $inventory=Get-AttInventory (Join-Path $Path 'db') -DbOnly; $receipt['completed'][$Name]=@{completed_at=[DateTimeOffset]::UtcNow.ToString('o');files=(Get-AttOwnedFiles $inventory $product[0]['root'])}; Write-AttJsonAtomic (Join-Path $Path '.att-producer.json') $receipt; return ,$receipt
}
function Package-AttProducer([string]$Path,[string]$Output) {
    Assert-AttSeparate @($Path,$Output); $receipt=Read-AttProducerReceipt $Path; $contract=$receipt['contract']; $files=Get-AttInventory (Join-Path $Path 'db') -DbOnly
    $flavors=[string[]]@($contract['products'] | ForEach-Object {$_['flavor']}); [Array]::Sort($flavors,[StringComparer]::Ordinal); if (($flavors -join "`n") -cne ((Get-AttKeys $receipt['completed']) -join "`n")) { throw 'All declared flavors require completion receipts' }
    $roots=[string[]]@($contract['products'] | ForEach-Object {$_['root']}); foreach($name in $files.Keys) { if ($roots -cnotcontains $name.Split('/')[0]) { throw 'Undeclared generated DB root' } }
    $products=@(); $union=New-Object 'System.Collections.Generic.HashSet[string]' ([StringComparer]::Ordinal)
    foreach($product in $contract['products']) {
        $own=Get-AttOwnedFiles $files $product['root']; if ((ConvertTo-AttCanonical $own) -cne (ConvertTo-AttCanonical $receipt['completed'][$product['flavor']]['files'])) { throw 'DB changed after completion' }
        $closure=New-Object 'System.Collections.Generic.HashSet[string]' ([StringComparer]::Ordinal); $closure.UnionWith([string[]]@($own.Keys)); foreach($name in @($own.Keys)) { if ($name.EndsWith('.xml',[StringComparison]::OrdinalIgnoreCase)) { $closure.UnionWith([string[]](Get-AttXmlClosure (Join-Path $Path 'db') $name $files)) } }; $union.UnionWith($closure)
        $paths=[string[]]@($closure); [Array]::Sort($paths,[StringComparer]::Ordinal); $products+=@{flavor=$product['flavor'];profile=$product['profile'];recipe=$product['recipe'];root=$product['root'];files=$paths}
    }; if (-not $union.SetEquals([string[]]@($files.Keys))) { throw 'Incomplete product load-closure union' }
    Assert-AttEmptyDirectory $Output; $prefix='db-'+$contract['git_object_format']+'-'+$contract['commit']; $zipPath=Join-Path $Output ($prefix+'.zip'); $manifestPath=Join-Path $Output ($prefix+'.sha256'); $metaPath=Join-Path $Output ($prefix+'.metadata.json')
    $stream=New-Object IO.FileStream($zipPath,[IO.FileMode]::CreateNew,[IO.FileAccess]::Write,[IO.FileShare]::None); $zip=New-Object IO.Compression.ZipArchive($stream,[IO.Compression.ZipArchiveMode]::Create,$true)
    try { foreach($name in (Get-AttKeys $files)) { $inputPath=Join-Path $Path ('db/'+$name); Assert-AttFile $inputPath 134217728; $bytes=[IO.File]::ReadAllBytes($inputPath); if ($bytes.LongLength -ne $files[$name]['size'] -or (Get-AttHash $bytes) -cne $files[$name]['sha256']) { throw 'DB changed while packaging' }; $entry=$zip.CreateEntry($name,[IO.Compression.CompressionLevel]::Optimal); $entry.LastWriteTime=New-Object DateTimeOffset(1980,1,1,0,0,0,[TimeSpan]::Zero); $entry.ExternalAttributes=([int]0x81A4 -shl 16); $out=$entry.Open(); try { $out.Write($bytes,0,$bytes.Length) } finally { $out.Dispose() } } } finally { $zip.Dispose(); $stream.Flush($true); $stream.Dispose() }
    $lines=@(); foreach($name in (Get-AttKeys $files)) { $lines+=$files[$name]['sha256']+'  '+$name+"`n" }; Write-AttNew $manifestPath ($script:AttUtf8.GetBytes($lines -join ''))
    if ((ConvertTo-AttCanonical (Get-AttInventory (Join-Path $Path 'db') -DbOnly)) -cne (ConvertTo-AttCanonical $files)) { throw 'DB changed during packaging' }
    $metadata=@{schema=2;repository=$script:AttRepository;commit=$contract['commit'];git_object_format=$contract['git_object_format'];archive=@{name=($prefix+'.zip');sha256=(Get-AttFileHash $zipPath);size=(New-Object IO.FileInfo($zipPath)).Length};manifest=@{name=($prefix+'.sha256');sha256=(Get-AttFileHash $manifestPath);size=(New-Object IO.FileInfo($manifestPath)).Length};products=$products;files=$files;producer=@{tool='ATT script producer';fresh_staging=$true;stage_id=$receipt['stage_id'];started_at=$receipt['started_at'];required_flavors=$flavors;completed_flavors=$flavors;completion='producer-declared-after-success'}}
    Write-AttJsonNew $metaPath $metadata; return ,$metadata
}
function Assert-AttToolsPin([string]$Path,[string]$Pin) { [void](Assert-AttOid $Pin); if ((Invoke-AttGit $Path @('rev-parse','HEAD')).Trim() -cne $Pin) { throw 'Trusted tools HEAD mismatch' } }
function Resolve-AttSelectedOid([string]$Path,[string]$Value) { [void](Assert-AttOid $Value); if ((Invoke-AttGit $Path @('rev-parse','--verify',($Value+'^{commit}'))).Trim() -cne $Value) { throw 'Selected exact commit is unavailable' }; return $Value }
function Collect-AttNewCd {
    if (-not $ToolsSource) { throw 'Trusted tools source required' }; $pin=$env:TOOLS_SHA; if ($ToolsSha) { $pin=$ToolsSha }; Assert-AttToolsPin $ToolsSource $pin
    $event=$env:EVENT_NAME; $repo=$env:REPOSITORY; if (-not $repo) { throw 'Explicit repository required' }; $publish=$event -ne 'pull_request' -and $repo -ceq $script:AttRepository; $days=7; $ref=$env:REF_NAME; $selected=New-Object 'System.Collections.Generic.List[string]'
    switch($event) {
        'workflow_dispatch' { $sha=Resolve-AttSelectedOid $ToolsSource $env:TARGET_SHA; $selected.Add($sha); $ref='manual:'+ $sha }
        'pull_request' { $selected.Add((Assert-AttOid $env:PR_SHA)); $ref='pull-request:'+ $env:PR_NUMBER; $publish=$false }
        'push' { if ($env:EVENT_DELETED -ne 'true') { $head=Resolve-AttSelectedOid $ToolsSource $env:HEAD_SHA; if ($env:REF_NAME -ceq $env:DEFAULT_BRANCH) { $days=30; $eventCommits=ConvertFrom-AttJson $env:EVENT_COMMITS; if ($eventCommits -isnot [Array]) { throw 'Push commit list required' }; foreach($entry in $eventCommits) { Assert-AttMap $entry; if ($entry['id']) { $selected.Add((Resolve-AttSelectedOid $ToolsSource $entry['id'])) } } }; $selected.Add($head) } }
        default { throw 'Unsupported explicit workflow event' }
    }
    if ($ref -and ($ref.Length -gt 256 -or $ref -match '[\x00-\x1f\x7f]')) { throw 'Invalid source ref label' }; $seen=New-Object 'System.Collections.Generic.HashSet[string]' ([StringComparer]::Ordinal); $include=@(); foreach($sha in $selected) { if ($seen.Add($sha)) { $include+=@{sha=$sha;publish=$publish;retention_days=$days;source_ref=$ref} } }; if ($include.Count -gt 256) { throw 'Matrix exceeds 256 selected commits' }
    $result=@{has_commits=($include.Count -gt 0);publish=($publish -and $include.Count -gt 0);matrix=@{include=$include}}
    if ($env:GITHUB_OUTPUT) { $out='has_commits='+$result.has_commits.ToString().ToLowerInvariant()+"`n"+'publish='+$result.publish.ToString().ToLowerInvariant()+"`n"+'matrix='+(ConvertTo-Json -InputObject $result.matrix -Compress -Depth 100)+"`n"; [IO.File]::AppendAllText($env:GITHUB_OUTPUT,$out,$script:AttUtf8) }; return ,$result
}
function Export-AttParserSource([string]$RepositoryPath,[string]$Oid,[string]$Output) {
    Assert-AttEmptyDirectory $Output; $tree=Invoke-AttGit $RepositoryPath @('ls-tree','-rz',$Oid,'--','.contrib/.tools','.contrib/.db'); $expected=New-AttMap
    foreach($row in $tree.Split([char]0)) { if (-not $row) { continue }; if ($row -cnotmatch '^(100644|100755) blob ([0-9a-f]+)\t(.+)$') { throw 'Parser source symlink/submodule refused' }; $mode=$Matches[1]; $blob=$Matches[2]; $name=$Matches[3]; [void](Assert-AttSafePath $name); $expected.Add($name,@{oid=$blob;mode=$mode}) }; foreach($path in (Get-AttInputPaths)) { if (-not $expected.ContainsKey($path)) { throw 'Pinned Parser/configuration input missing' } }
    Export-AttGitBlobs $RepositoryPath ((Invoke-AttGit $RepositoryPath @('rev-parse','--show-object-format')).Trim()) $expected $Output
}
function Build-AttNewCd {
    if ([Environment]::OSVersion.Platform -ne [PlatformID]::Win32NT) { throw 'The existing net48 Parser requires Windows' }
    if ($Publish -cnotin @('true','false')) { throw 'Publication must be literal true or false' }
    foreach($p in @($Source,$ToolsSource,$Stage,$OutputDirectory)) { if (-not $p -or -not [IO.Path]::IsPathRooted($p)) { throw 'Absolute source/tools/stage/output required' } }; Assert-AttSeparate @($Source,$ToolsSource,$Stage,$OutputDirectory); Assert-AttToolsPin $ToolsSource $ToolsSha
    if ((Invoke-AttGit $Source @('rev-parse','HEAD')).Trim() -cne (Assert-AttOid $ExpectedSha)) { throw 'Source HEAD mismatch' }; $format=(Invoke-AttGit $Source @('rev-parse','--show-object-format')).Trim(); [void](Assert-AttOid $ExpectedSha $format); if (-not $SourceRef -or $SourceRef.Length -gt 256 -or $SourceRef -match '[\x00-\x1f\x7f]') { throw 'Invalid source ref' }
    $inputs=New-AttMap; foreach($path in (Get-AttInputPaths)) { $bytes=Invoke-AttGit $Source @('show',($ExpectedSha+':'+$path)) -Binary; if (-not $bytes.Length -or [Text.Encoding]::ASCII.GetString($bytes,0,[Math]::Min(128,$bytes.Length)).StartsWith('version https://git-lfs.github.com/spec/v1',[StringComparison]::Ordinal)) { throw 'Missing/unresolved pinned Parser input' }; $inputs.Add($path,(Get-AttHash $bytes)) }
    [void](Initialize-AttProducer $Stage (New-AttNewCdContract $ExpectedSha $format)); Assert-AttEmptyDirectory $OutputDirectory
    foreach($name in $script:AttConfigs.Keys) {
        $scratch=Join-Path ([IO.Path]::GetDirectoryName($Stage)) ('att-script-parser-'+[guid]::NewGuid().ToString('N')); $override=Join-Path $Stage ('.contrib/new-cd-'+$name+'.config'); Write-AttJsonNew $override @{'root-addon'=$Stage.Replace('\','/');'db-relative'=($script:AttRoots[$name]+'/')}
        try {
            Export-AttParserSource $Source $ExpectedSha $scratch; $arguments=@('auto',('baseconfig='+ (Join-Path $scratch $script:AttBaseConfig))); if ($script:AttConfigs[$name]) { $arguments+=('config='+ (Join-Path $scratch $script:AttConfigs[$name])) }; $arguments+=('config='+$override)
            $output=Invoke-AttProcess (Join-Path $scratch $script:AttParser) $arguments (Join-Path $scratch '.contrib/.tools') -StripTokens -IncludeStderr -MaxOutput 67108864; $logs=Join-Path $Stage '.contrib/new-cd-logs'; [void][IO.Directory]::CreateDirectory($logs); Write-AttNew (Join-Path $logs ($name+'.log')) ($script:AttUtf8.GetBytes($output))
            if ($output -cmatch '(?m)^\s*(?:ERROR:|==== EXCEPTION ====|-- Errors encountered during (?:Processing|Parse)\.)') { throw ('Parser reported failure: '+$name) }; [void](Complete-AttProducer $Stage $name)
        } finally { if ([IO.Directory]::Exists($scratch)) { [void](Assert-AttNoLinks $scratch); [IO.Directory]::Delete($scratch,$true) } }
    }
    $metadata=Package-AttProducer $Stage $OutputDirectory; $now=[DateTimeOffset]::UtcNow; $metadata['key']=$format+'-'+$ExpectedSha; $metadata['source_ref']=$SourceRef; $metadata['publish']=$Publish -eq 'true'; $metadata['built_at']=$now.ToString('o'); $metadata['expires_at']=$now.AddDays($RetentionDays).ToString('o'); $metadata['new_cd']=@{recipe=$script:AttRecipe;tools_commit=$ToolsSha;source_commit=$ExpectedSha;source_inputs=$inputs}; $metaPath=Join-Path $OutputDirectory ('db-'+$metadata['key']+'.metadata.json'); Write-AttJsonAtomic $metaPath $metadata
    [void](Test-AttNewCdBundle $OutputDirectory @($ExpectedSha) $ToolsSha)
    if ($env:GITHUB_OUTPUT) { [IO.File]::AppendAllText($env:GITHUB_OUTPUT,('key='+$metadata['key']+"`n"+'bundle='+$OutputDirectory.Replace('\','/')+"`n"),$script:AttUtf8) }; return ,$metadata
}
function Test-AttNewCdMetadata($Metadata,[string[]]$Expected,[string]$TrustedPin='') {
    if ($Metadata['git_object_format'] -cnotin @('sha1','sha256')) { throw 'Explicit Git object format required' }
    Assert-AttMap $Metadata; foreach($field in @('commit','git_object_format','repository','key')) { [void](Assert-AttText $Metadata[$field]) }; $oid=Assert-AttOid $Metadata['commit'] $Metadata['git_object_format']; if ((Assert-AttInteger $Metadata['schema']) -ne 2 -or $Metadata['repository'] -cne $script:AttRepository -or $Expected -cnotcontains $oid -or $Metadata['key'] -cne ($Metadata['git_object_format']+'-'+$oid)) { throw 'Unexpected selected source identity' }
    $contract=New-AttNewCdContract $oid $Metadata['git_object_format']; if ($Metadata['products'] -isnot [Array] -or $Metadata['products'].Count -ne 8) { throw 'All eight explicit products required' }
    foreach($product in $Metadata['products']) { Assert-AttMap $product; foreach($field in @('flavor','root','profile','recipe')) { [void](Assert-AttText $product[$field]) } }
    foreach($required in $contract['products']) { $matches=@($Metadata['products'] | Where-Object {$_['flavor'] -ceq $required['flavor']}); if ($matches.Count -ne 1) { throw 'Duplicate/missing NewCD flavor' }; foreach($key in @('flavor','root','profile','recipe')) { if ($matches[0][$key] -cne $required[$key]) { throw 'NewCD fixed profile/recipe mismatch' } } }
    if ($Metadata['publish'] -isnot [bool]) { throw 'Explicit publication boolean required' }; $ref=Assert-AttText $Metadata['source_ref']; if (-not $ref -or $ref.Length -gt 256 -or $ref -match '[\x00-\x1f\x7f]') { throw 'Invalid source ref label' }
    foreach($field in @('built_at','expires_at')) { $value=Assert-AttText $Metadata[$field]; if ($value -cnotmatch '^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(?:\.\d{1,7})?(?:Z|\+00:00)$') { throw 'Explicit ISO UTC timestamp required' } }
    $built=[DateTimeOffset]::Parse($Metadata['built_at'],[Globalization.CultureInfo]::InvariantCulture); $expires=[DateTimeOffset]::Parse($Metadata['expires_at'],[Globalization.CultureInfo]::InvariantCulture); if ($built.Offset -ne [TimeSpan]::Zero -or $expires.Offset -ne [TimeSpan]::Zero -or ($expires-$built).TotalDays -notin @(7,30)) { throw 'Invalid retention declaration' }
    $provenance=$Metadata['new_cd']; Assert-AttMap $provenance; foreach($field in @('recipe','source_commit','tools_commit')) { [void](Assert-AttText $provenance[$field]) }; if ($provenance['recipe'] -cne $script:AttRecipe -or $provenance['source_commit'] -cne $oid) { throw 'NewCD provenance mismatch' }; [void](Assert-AttOid $provenance['tools_commit']); if ($TrustedPin -and $provenance['tools_commit'] -cne $TrustedPin) { throw 'Trusted tools pin mismatch' }
    $inputs=$provenance['source_inputs']; Assert-AttMap $inputs; if (((Get-AttKeys $inputs) -join "`n") -cne ((Get-AttInputPaths) -join "`n")) { throw 'Incomplete Parser input evidence' }; foreach($hash in $inputs.Values) { if ($hash -isnot [string] -or $hash -cnotmatch '^[0-9a-f]{64}$') { throw 'Invalid Parser input hash' } }
}
function Test-AttNewCdBundle([string]$Directory,[string[]]$Expected,[string]$TrustedPin='') {
    [void](Assert-AttNoLinks $Directory); $sidecars=@([IO.Directory]::GetFiles($Directory,'db-*.metadata.json')); if ($sidecars.Count -ne 1) { throw 'One schema 2 metadata sidecar required' }; $metadata=Read-AttJson $sidecars[0]; Test-AttNewCdMetadata $metadata $Expected $TrustedPin
    $prefix='db-'+$metadata['key']; $names=[string[]]@($prefix+'.zip',$prefix+'.sha256',$prefix+'.metadata.json'); $actual=[string[]]@([IO.Directory]::EnumerateFileSystemEntries($Directory) | ForEach-Object {[IO.Path]::GetFileName($_)}); [Array]::Sort($actual,[StringComparer]::Ordinal); [Array]::Sort($names,[StringComparer]::Ordinal); if (($actual -join "`n") -cne ($names -join "`n")) { throw 'Incomplete/unexpected bundle files' }
    $verify=Join-Path ([IO.Path]::GetTempPath()) ('att-script-verify-'+[guid]::NewGuid().ToString('N')); try { [void](Test-AttBundle $Directory $verify @{commit=$metadata['commit'];object_format=$metadata['git_object_format'];flavor='retail';profile='new-cd-retail-auto';recipe=$script:AttRecipe}) } finally { if ([IO.Directory]::Exists($verify)) { [void](Assert-AttNoLinks $verify); [IO.Directory]::Delete($verify,$true) } }; return ,$metadata
}
function Get-AttPublicationPlan($Metadata,$Assets,$Existing=$null) {
    Test-AttNewCdMetadata $Metadata @($Metadata['commit']); if (-not $Metadata['publish']) { throw 'Read-only PR bundle cannot be published' }; $seen=New-Object 'System.Collections.Generic.HashSet[string]' ([StringComparer]::Ordinal); foreach($asset in $Assets) { Assert-AttMap $asset; $name=Assert-AttText $asset['name']; if (-not $seen.Add($name)) { throw 'Duplicate release asset name' } }
    $prefix='db-'+$Metadata['key']; if ($seen.Contains($prefix+'.json')) { throw 'Legacy asset conflict requires reviewed migration' }; $count=0; foreach($name in @($prefix+'.zip',$prefix+'.sha256',$prefix+'.metadata.json')) { if ($seen.Contains($name)) { $count++ } }; if (-not $count) { return 'upload' }; if ($count -ne 3) { throw 'Partial existing triple; refusing repair/overwrite/delete' }; if (-not $Existing) { throw 'Existing triple must be downloaded and verified' }; Test-AttNewCdMetadata $Existing @($Metadata['commit']); if (-not $Existing['publish']) { throw 'Existing read-only triple cannot authorize publication' }
    foreach($field in @('schema','repository','commit','git_object_format','key','archive','manifest','products','files')) { if ((ConvertTo-AttCanonical $Metadata[$field]) -cne (ConvertTo-AttCanonical $Existing[$field])) { throw 'Published immutable artifact conflict' } }; if ((ConvertTo-AttCanonical $Metadata['new_cd']['source_inputs']) -cne (ConvertTo-AttCanonical $Existing['new_cd']['source_inputs'])) { throw 'Published Parser input evidence conflict' }; return 'keep'
}
function Invoke-AttGh([string[]]$Arguments) { return Invoke-AttProcess 'gh' $Arguments ([IO.Path]::GetFullPath($Bundles)) }
function Publish-AttNewCd {
    if ($Repository -cne $script:AttRepository) { throw 'Canonical publication repository required' }; [void](Assert-AttOid $ToolsSha); [void](Assert-AttOid $TargetSha); Assert-AttToolsPin $ToolsSource $ToolsSha
    $expected=ConvertFrom-AttJson $ExpectedCommitsJson; if ($expected -isnot [Array] -or -not $expected.Count) { throw 'Explicit nonempty selected commit allowlist required' }; $unique=New-Object 'System.Collections.Generic.HashSet[string]' ([StringComparer]::Ordinal); foreach($oid in $expected) { if ($oid -isnot [string] -or -not $unique.Add((Assert-AttOid $oid))) { throw 'Duplicate/invalid selected commit allowlist' } }
    [void](Assert-AttNoLinks $Bundles); $incoming=@(); foreach($dir in [IO.Directory]::EnumerateFileSystemEntries($Bundles)) { if (-not [IO.Directory]::Exists($dir)) { throw 'Unexpected top-level bundle file' }; $metadata=Test-AttNewCdBundle $dir ([string[]]$expected) $ToolsSha; if (-not $metadata['publish']) { throw 'Read-only bundle cannot be published' }; $incoming+=@{directory=$dir;metadata=$metadata} }; if (-not $incoming.Count) { throw 'No complete bundles available' }; $seen=New-Object 'System.Collections.Generic.HashSet[string]' ([StringComparer]::Ordinal); foreach($item in $incoming) { if (-not $seen.Add($item.metadata['key'])) { throw 'Duplicate incoming source identity' } }
    $release=$null; try { $release=ConvertFrom-AttJson (Invoke-AttGh @('api',('repos/'+$Repository+'/releases/tags/db-artifacts'))) } catch { if ($_.Exception.Message -notmatch '(?:HTTP 404|Not Found \(HTTP 404\))') { throw } }
    $assets=@(); if ($release) { $pages=ConvertFrom-AttJson (Invoke-AttGh @('api','--paginate','--slurp',('repos/'+$Repository+'/releases/'+$release['id']+'/assets?per_page=100'))); if ($pages -isnot [Array]) { throw 'Asset pagination array required' }; foreach($page in $pages) { if ($page -isnot [Array]) { throw 'Invalid release asset page' }; $assets+=@($page) } }
    # EVERY incoming and collided existing triple is checked before first mutation.
    $plans=@(); foreach($item in $incoming) {
        $prefix='db-'+$item.metadata['key']; $existing=$null; $present=@($assets | Where-Object {$_['name'] -in @($prefix+'.zip',$prefix+'.sha256',$prefix+'.metadata.json')})
        if ($present.Count -eq 3) {
            $scratch=Join-Path ([IO.Path]::GetTempPath()) ('att-script-existing-'+[guid]::NewGuid().ToString('N')); Assert-AttEmptyDirectory $scratch
            try { foreach($name in @($prefix+'.zip',$prefix+'.sha256',$prefix+'.metadata.json')) { [void](Invoke-AttGh @('release','download','db-artifacts','--repo',$Repository,'--pattern',$name,'--dir',$scratch)) }; $existing=Test-AttNewCdBundle $scratch @($item.metadata['commit']) } finally { if ([IO.Directory]::Exists($scratch)) { [void](Assert-AttNoLinks $scratch); [IO.Directory]::Delete($scratch,$true) } }
        }; $plans+=@{directory=$item.directory;key=$item.metadata['key'];action=(Get-AttPublicationPlan $item.metadata $assets $existing)}
    }; if ($PlanOnly) { return ,@{plans=$plans;mutated=$false} }
    if (-not $release) { [void](Invoke-AttGh @('release','create','db-artifacts','--repo',$Repository,'--target',$TargetSha,'--title','Database Artifacts','--notes','Commit-addressed schema 2 database snapshots generated by Parser.','--prerelease')) }
    foreach($plan in $plans) { if ($plan.action -eq 'upload') { $prefix='db-'+$plan.key; [void](Invoke-AttGh @('release','upload','db-artifacts',(Join-Path $plan.directory ($prefix+'.zip')),(Join-Path $plan.directory ($prefix+'.sha256')),(Join-Path $plan.directory ($prefix+'.metadata.json')),'--repo',$Repository)) } }; return ,@{plans=$plans;retention_cleanup=$false;legacy_index_updated=$false}
}
function Test-AttNewCdSelf {
    $names=New-Object 'System.Collections.Generic.List[string]'; $root=Join-Path ([IO.Path]::GetTempPath()) ('att-script-tests-'+[guid]::NewGuid().ToString('N')); [void][IO.Directory]::CreateDirectory($root)
    function Reject-NewCd([scriptblock]$Test) { $rejected=$false; try { & $Test | Out-Null } catch { $rejected=$true }; if (-not $rejected) { throw 'Expected NewCD refusal' } }
    function Pass-NewCd([string]$Name,[scriptblock]$Test) { & $Test; $names.Add($Name) }
    try {
        $contract=New-AttNewCdContract ('a'*40) 'sha1'; Pass-NewCd 'eight-pinned-profiles' { if ($contract['products'].Count -ne 8 -or (Get-AttInputPaths).Count -ne 9) { throw 'Recipe coverage mismatch' } }
        Pass-NewCd 'stage-no-clear' { $path=Join-Path $root 'dirty'; [void][IO.Directory]::CreateDirectory($path); Write-AttNew (Join-Path $path 'keep') ([byte[]]@(1)); Reject-NewCd { Initialize-AttProducer $path $contract }; if (-not [IO.File]::Exists((Join-Path $path 'keep'))) { throw 'Existing file lost' } }
        Pass-NewCd 'completion-gate' { $path=Join-Path $root 'partial'; [void](Initialize-AttProducer $path $contract); Reject-NewCd { Package-AttProducer $path (Join-Path $root 'out') } }
        Pass-NewCd 'era-requires-sod' { $c=@{schema=2;repository=$script:AttRepository;commit=('a'*40);git_object_format='sha1';products=@(@{flavor='era';root='Vanilla';profile='explicit';recipe='explicit'})}; Reject-NewCd { Test-AttContract $c } }
        Pass-NewCd 'bidirectional-path-overlap' { Reject-NewCd { Assert-AttSeparate @($root,(Join-Path $root 'nested')) }; Reject-NewCd { Assert-AttSeparate @((Join-Path $root 'nested'),$root) } }
        $fresh=Join-Path $root 'eight-products'; [void](Initialize-AttProducer $fresh $contract)
        foreach($product in $contract['products']) {
            $db=Join-Path $fresh ('db/'+$product['root']); [void][IO.Directory]::CreateDirectory($db)
            foreach($name in @('ReferenceDB.lua','LocalizationDB.lua')) { Write-AttNew (Join-Path $db $name) ($script:AttUtf8.GetBytes('-- exact fixture '+$product['flavor']+"`n")) }
            $xml='<Ui><Script file="LocalizationDB.lua"/></Ui>'; if ($product['flavor'] -eq 'era') { $xml='<Ui><Script file="LocalizationDB.lua"/><Include file="../VanillaSOD/Database.xml"/></Ui>' }; Write-AttNew (Join-Path $db 'Database.xml') ($script:AttUtf8.GetBytes($xml))
        }; foreach($product in $contract['products']) { [void](Complete-AttProducer $fresh $product['flavor']) }
        $artifact=Join-Path $root 'complete-bundle'; $metadata=Package-AttProducer $fresh $artifact; $now=[DateTimeOffset]::UtcNow
        $metadata['key']='sha1-'+('a'*40); $metadata['source_ref']='manual:'+('a'*40); $metadata['publish']=$true; $metadata['built_at']=$now.ToString('o'); $metadata['expires_at']=$now.AddDays(7).ToString('o'); $inputHashes=New-AttMap; foreach($path in (Get-AttInputPaths)) { $inputHashes.Add($path,('b'*64)) }; $metadata['new_cd']=@{recipe=$script:AttRecipe;tools_commit=('c'*40);source_commit=('a'*40);source_inputs=$inputHashes}; Write-AttJsonAtomic (Join-Path $artifact ('db-'+$metadata['key']+'.metadata.json')) $metadata
        Pass-NewCd 'producer-consumer-eight-root-roundtrip' { [void](Test-AttNewCdBundle $artifact @('a'*40) ('c'*40)) }
        Pass-NewCd 'era-sod-xml-closure' { $era=@($metadata['products'] | Where-Object {$_['flavor'] -eq 'era'})[0]; if ($era['files'] -cnotcontains 'VanillaSOD/Database.xml' -or $era['files'] -cnotcontains 'VanillaSOD/LocalizationDB.lua') { throw 'Era dependency closure absent' } }
        Pass-NewCd 'readonly-publication-refused' { $copy=ConvertFrom-AttJson (ConvertTo-Json -InputObject $metadata -Depth 100); $copy['publish']=$false; Reject-NewCd { Get-AttPublicationPlan $copy @() } }
        Pass-NewCd 'fresh-publication-plan' { if ((Get-AttPublicationPlan $metadata @()) -cne 'upload') { throw 'Expected upload plan' } }
        $assets=@(); foreach($suffix in @('.zip','.sha256','.metadata.json')) { $assets+=@{name=('db-'+$metadata['key']+$suffix)} }
        Pass-NewCd 'immutable-existing-plan-keeps-original' { if ((Get-AttPublicationPlan $metadata $assets $metadata) -cne 'keep') { throw 'Expected keep plan' } }
        Pass-NewCd 'partial-triple-refused' { Reject-NewCd { Get-AttPublicationPlan $metadata @($assets[0]) } }
        Pass-NewCd 'legacy-collision-refused' { Reject-NewCd { Get-AttPublicationPlan $metadata @(@{name=('db-'+$metadata['key']+'.json')}) } }
        Pass-NewCd 'existing-immutable-contract-conflict' { $copy=ConvertFrom-AttJson (ConvertTo-Json -InputObject $metadata -Depth 100); $copy['archive']['sha256']='d'*64; Reject-NewCd { Get-AttPublicationPlan $metadata $assets $copy } }
        Pass-NewCd 'late-changed-completed-bytes-refused' { [IO.File]::AppendAllText((Join-Path $fresh 'db/Standard/ReferenceDB.lua'),'changed',$script:AttUtf8); Reject-NewCd { Package-AttProducer $fresh (Join-Path $root 'changed-output') } }
        Pass-NewCd 'published-directory-never-overwritten' { Reject-NewCd { Package-AttProducer $fresh $artifact }; if (-not [IO.File]::Exists((Join-Path $artifact ('db-'+$metadata['key']+'.zip')))) { throw 'Existing artifact lost' } }
        Pass-NewCd 'unselected-source-refused' { Reject-NewCd { Test-AttNewCdMetadata $metadata @('d'*40) } }
        Pass-NewCd 'trusted-tools-pin-refused' { Reject-NewCd { Test-AttNewCdMetadata $metadata @('a'*40) ('d'*40) } }
        Pass-NewCd 'source-input-evidence-required' { $copy=ConvertFrom-AttJson (ConvertTo-Json -InputObject $metadata -Depth 100); [void]$copy['new_cd']['source_inputs'].Remove($script:AttParser); Reject-NewCd { Test-AttNewCdMetadata $copy @('a'*40) } }
        return @{tests=$names.Count;passed=$names.Count;names=$names.ToArray();scope='PowerShell local producer fixtures; no Parser/GitHub publication execution'}
    } finally { [void](Assert-AttNoLinks $root); [IO.Directory]::Delete($root,$true) }
}
if ($LibraryOnly) { return }
try {
    $result=$null
    switch($Command) {
        'collect' { $result=Collect-AttNewCd }
        'build' { $result=Build-AttNewCd }
        'publish' { $result=Publish-AttNewCd }
        'producer-init' { $result=Initialize-AttProducer $Stage (Read-AttJson $Contract) }
        'producer-complete' { if (-not $GeneratorSucceeded) { throw 'Explicit successful generator declaration required' }; $result=Complete-AttProducer $Stage $Flavor }
        'producer-package' { $result=Package-AttProducer $Stage $OutputDirectory }
        'selftest' { $result=Test-AttNewCdSelf }
        default { throw 'Explicit NewCD command required' }
    }; ConvertTo-Json -InputObject $result -Depth 100
} catch { Write-Error $_; exit 1 }
