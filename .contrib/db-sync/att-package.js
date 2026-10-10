/* macOS system-JXA producer. This module does not execute Parser or publish assets. */
var ATTProducer = (function () {
    var P = {}, A = null;
    var repository = 'ATTWoWAddon/AllTheThings', recipe = 'new-cd-auto-v1';
    var roots = { retail:'Standard', era:'Vanilla', sod:'VanillaSOD', tbc:'TBC', wrath:'Wrath', cata:'Cata', mists:'Mists', forever:'Camelot' };
    var configs = { retail:null, era:'.contrib/.db/standard/.config/classic/01 - Classic Era.config', sod:'.contrib/.db/standard/.config/classic/01 - Classic SOD.config', tbc:'.contrib/.db/standard/.config/classic/02 - TBC.config', wrath:'.contrib/.db/standard/.config/classic/03 - Wrath.config', cata:'.contrib/.db/standard/.config/classic/04 - Cataclysm.config', mists:'.contrib/.db/standard/.config/classic/05 - Mists of Pandaria.config', forever:'.contrib/.db/forever/.config/forever.config' };
    var flavors = Object.keys(roots), baseConfig = '.contrib/.db/standard/.config/retail/retail.config', parserPath = '.contrib/.tools/Parser.exe';
    var receiptName = '.att-script-producer.json', limits = { maxEntries:20000, maxFileBytes:128*1024*1024, maxTotalBytes:1024*1024*1024, maxArchiveBytes:512*1024*1024 };
    var inputs = [baseConfig,parserPath].concat(flavors.map(function (f) { return configs[f]; }).filter(function (p) { return p !== null; })).sort();
    P.flavors=flavors.slice();P.roots=roots;P.configs=configs;P.recipe=recipe;
    function fail(message) { A.fail(message); }
    function same(a,b) { return A.canonical(a)===A.canonical(b); }
    function parent(path) { return ObjC.unwrap($(A.location(path)).stringByDeletingLastPathComponent); }
    function name(path) { return ObjC.unwrap($(path).lastPathComponent); }
    function oid(value,format) { if(format!==undefined&&format!=='sha1'&&format!=='sha256')fail('Unsupported Git object format');if(typeof value!=='string'||!(format==='sha1'?/^[0-9a-f]{40}$/:format==='sha256'?/^[0-9a-f]{64}$/:/^(?:[0-9a-f]{40}|[0-9a-f]{64})$/).test(value))fail('Full lowercase Git commit required');return value; }
    function portable(path) { A.safeRelative(path);if(/[^\x20-\x7e]/.test(path))fail('Nonportable generated path');return path; }
    function directories(path) { var parts=path.split('/'),result=[];parts.pop();while(parts.length){result.push(parts.join('/'));parts.pop();}return result; }
    function sourceCheck(source,commit,format) {
        A.noLinks(source);if(!A.regular(source,true))fail('Source repository required');
        source=A.real(source);if(A.git(source,['rev-parse','--show-toplevel']).trim()!==source)fail('Source must be the repository root');
        var actual=A.git(source,['rev-parse','--show-object-format']).trim();if(format&&actual!==format)fail('Source object format changed');oid(commit,actual);
        if(A.git(source,['rev-parse','HEAD']).trim()!==commit)fail('Source HEAD differs from selected commit');
        if(A.git(source,['for-each-ref','--format=%(refname)','refs/replace']).trim()!=='')fail('Source replacement refs are not supported');
        if(A.git(source,['status','--porcelain=v1','-z','--untracked-files=all','--ignored=matching'])!=='')fail('Source contains tracked, untracked or ignored user changes');
        A.git(source,['ls-files','-v','-z']).split('\0').filter(Boolean).forEach(function (row) { if(row.slice(0,2)!=='H ')fail('Source has assume-unchanged or skip-worktree index flags'); });
        return actual;
    }
    function inputHashes(source,commit) {
        var temp=A.mkdir(A.real(ObjC.unwrap($.NSTemporaryDirectory()))+'/att-producer-inputs-'+A.uuid()),result={};
        try { inputs.forEach(function (path,index) { var target=temp+'/'+index,r=A.exec(['/usr/bin/git','--no-optional-locks','show',commit+':'+path],source,{stdoutFile:target,maxFileOutput:limits.maxFileBytes,env:{GIT_TERMINAL_PROMPT:'0',GIT_OPTIONAL_LOCKS:'0',GIT_NO_REPLACE_OBJECTS:'1'}});if(r.code!==0||A.size(target)===0)fail('Missing fixed Parser input: '+path);var data=A.readBytes(target,limits.maxFileBytes),prefix=A.bytes(data.subdataWithRange($.NSMakeRange(0,Math.min(Number(data.length),128))));var text=String.fromCharCode.apply(null,prefix);if(text.indexOf('version https://git-lfs.github.com/spec/v1')===0)fail('Unresolved Git LFS Parser input');result[path]=A.hashFile(target); });return result; }
        finally { A.remove(temp); }
    }
    function contract(commit,format) {
        oid(commit,format);return {schema:2,repository:repository,commit:commit,git_object_format:format,products:flavors.map(function (f) { return {flavor:f,root:roots[f],profile:'new-cd-'+f+'-auto',recipe:recipe}; })};
    }
    function empty(path) { A.noLinks(path);if(A.exists(path)&&(!A.regular(path,true)||A.walk(path).length!==0))fail('Destination must be new or empty; existing content is preserved'); }
    function checkSeparate(paths) { for(var i=0;i<paths.length;i++)for(var j=i+1;j<paths.length;j++)if(A.overlap(paths[i],paths[j]))fail('Source, stage, export and output locations must be separate'); }
    function stageContent(stage) {
        A.walk(stage).forEach(function (row) {
            if(row.type!=='file'&&row.type!=='directory')fail('Special or linked stage entry');
            if(row.relative===receiptName||row.relative==='db'||row.relative.indexOf('db/')===0||row.relative==='.contrib')return;
            if(/^\.contrib\/new-cd-(retail|era|sod|tbc|wrath|cata|mists|forever)\.config$/.test(row.relative)&&row.type==='file')return;
            if(row.relative==='.contrib/.db'||row.relative==='.contrib/.db/shared'||row.relative==='.contrib/.db/shared/constants'||row.relative.indexOf('.contrib/.db/shared/constants/')===0)return;
            fail('Unexpected content outside generated stage roots: '+row.relative);
        });
    }
    function readReceipt(stage) {
        A.noLinks(stage);if(!A.regular(stage,true))fail('Fresh producer stage required');stage=A.real(stage);stageContent(stage);
        var r=A.readJSON(stage+'/'+receiptName,16*1024*1024);
        if(!r||r.fresh_staging!==true||typeof r.stage_id!=='string'||!/^(?:[0-9a-f]{32}|[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})$/.test(r.stage_id)||!r.completed||Array.isArray(r.completed)||!r.exports||Array.isArray(r.exports)||!r.source_inputs||!r.contract)fail('Invalid fresh producer receipt');
        if(!same(r.contract,contract(r.contract.commit,r.contract.git_object_format)))fail('Producer contract is not the fixed eight-profile recipe');
        oid(r.tools_commit);sourceCheck(r.source,r.contract.commit,r.contract.git_object_format);
        if(!same(r.source_inputs,inputHashes(r.source,r.contract.commit)))fail('Fixed Parser source inputs changed');
        flavors.forEach(function (f) { var override={ 'root-addon':stage, 'db-relative':roots[f]+'/' };if(!same(A.readJSON(stage+'/.contrib/new-cd-'+f+'.config'),override))fail('Parser output override changed'); });
        Object.keys(r.completed).concat(Object.keys(r.exports)).forEach(function(f){if(flavors.indexOf(f)<0)fail('Unknown producer flavor');});
        return r;
    }
    function inventory(root,generated) {
        var files={},folded=Object.create(null),total=0,count=0;
        A.walk(root).forEach(function (row) {
            portable(row.relative);var foldedPath=row.relative.toLowerCase();if(folded[foldedPath])fail('Case-insensitive file or directory collision');folded[foldedPath]=true;
            if(row.type==='directory')return;if(row.type!=='file')fail('Special or linked producer entry');
            if(generated&&!/\.(?:lua|xml)$/i.test(row.relative))fail('Unexpected generated file type');
            if(row.size<0||(generated&&row.size===0)||row.size>limits.maxFileBytes)fail('Empty or oversized producer file');
            total+=row.size;count++;if(count>limits.maxEntries||total>limits.maxTotalBytes)fail('Producer inventory exceeds limit');
            files[row.relative]={sha256:A.hashFile(row.path),size:row.size};
        });return files;
    }
    function own(files,root) { var result={};Object.keys(files).sort().forEach(function (p) { if(p.indexOf(root+'/')===0)result[p]=files[p]; });return result; }
    function required(files,root) { ['ReferenceDB.lua','LocalizationDB.lua','Database.xml'].forEach(function (p) { if(!files[root+'/'+p])fail('Incomplete product: '+root+'/'+p); }); }
    function exportRows(source,commit) {
        var rows=A.git(source,['ls-tree','-rz',commit,'--','.contrib/.tools','.contrib/.db']).split('\0').filter(Boolean),result=[],seen=Object.create(null),format=A.git(source,['rev-parse','--show-object-format']).trim();
        rows.forEach(function (row) { var tab=row.indexOf('\t'),head=row.slice(0,tab).split(' '),p=row.slice(tab+1);portable(p);if(tab<0||head.length!==3||head[1]!=='blob'||(head[0]!=='100644'&&head[0]!=='100755')||(!/^\.contrib\/(?:\.tools|\.db)\//.test(p))||seen[p.toLowerCase()])fail('Unsupported or colliding Parser Git entry');oid(head[2],format);seen[p.toLowerCase()]=true;result.push({path:p,mode:head[0],oid:head[2]}); });
        inputs.forEach(function(p){if(!result.some(function(row){return row.path===p;}))fail('Source lacks fixed recipe input: '+p);});if(result.length>limits.maxEntries)fail('Parser source entry limit exceeded');return result.sort(function(a,b){return a.path<b.path?-1:a.path>b.path?1:0;});
    }
    function readBatch(raw,destination,rows,format) {
        ObjC.bindFunction('CC_SHA1_Init',['int',['void *']]);ObjC.bindFunction('CC_SHA1_Update',['int',['void *','void *','unsigned int']]);ObjC.bindFunction('CC_SHA1_Final',['int',['void *','void *']]);ObjC.bindFunction('fchmod',['int',['int','int']]);
        var handle=A.openRead(raw),buffer=$.NSData.data,offset=0,total=0;
        function refill(){if(offset===Number(buffer.length)){buffer=handle.readDataOfLength(1024*1024);offset=0;}return Number(buffer.length)-offset;}
        function take(count){var available=refill(),n=Math.min(count,available),value=buffer.subdataWithRange($.NSMakeRange(offset,n));offset+=n;return value;}
        function line(){var chars=[];while(chars.length<256){var available=refill();if(!available)fail('Truncated Parser batch header');var sample=A.bytes(buffer.subdataWithRange($.NSMakeRange(offset,Math.min(128,available))));for(var i=0;i<sample.length;i++){offset++;if(sample[i]===10)return String.fromCharCode.apply(null,chars);if(sample[i]<32||sample[i]>126)fail('Invalid Parser batch header bytes');chars.push(sample[i]);if(chars.length>=256)fail('Oversized Parser batch header');}}fail('Invalid Parser batch header');}
        try { rows.forEach(function(row){var header=line(),match=/^([0-9a-f]+) blob (0|[1-9][0-9]*)$/.exec(header);if(!match||match[1]!==row.oid)fail('Parser batch blob identity/header mismatch');var size=Number(match[2]);if(!isFinite(size)||size>limits.maxFileBytes||Math.floor(size)!==size)fail('Parser source blob exceeds byte limit');total+=size;if(total>limits.maxTotalBytes)fail('Parser source export exceeds total byte limit');
                var target=destination+'/'+row.path;A.writeBytes(target,'',true);var fd=$.open(target,1|256|4|16777216);if(fd<0)fail('Cannot open exclusive Parser source output');var writer=null;
                try{var stat=$.NSMutableData.dataWithLength(512);if($.fstat(fd,stat.mutableBytes)!==0)fail('Cannot stat Parser source output');var mode=A.bytes(stat.subdataWithRange($.NSMakeRange(4,2)));if(((mode[0]+mode[1]*256)&61440)!==32768)fail('Parser source output became special');writer=$.NSFileHandle.alloc.initWithFileDescriptorCloseOnDealloc(fd,true);
                    var ctx=$.NSMutableData.dataWithLength(128),digest=$.NSMutableData.dataWithLength(format==='sha1'?20:32),init=format==='sha1'?$.CC_SHA1_Init:$.CC_SHA256_Init,update=format==='sha1'?$.CC_SHA1_Update:$.CC_SHA256_Update,finish=format==='sha1'?$.CC_SHA1_Final:$.CC_SHA256_Final,prefix=A.nsdata('blob '+size+'\0');if(init(ctx.mutableBytes)!==1||update(ctx.mutableBytes,prefix.bytes,Number(prefix.length))!==1)fail('Cannot initialize Git blob digest');
                    var remaining=size,first=[];while(remaining){var data=take(Math.min(remaining,1024*1024)),length=Number(data.length);if(!length)fail('Truncated Parser blob payload');if(first.length<128)first=first.concat(A.bytes(data.subdataWithRange($.NSMakeRange(0,Math.min(length,128-first.length)))));writer.writeData(data);if(update(ctx.mutableBytes,data.bytes,length)!==1)fail('Cannot update Git blob digest');remaining-=length;}
                    if(finish(digest.mutableBytes,ctx.mutableBytes)!==1||A.bytes(digest).map(function(b){return ('0'+b.toString(16)).slice(-2);}).join('')!==row.oid)fail('Parser source payload differs from pinned Git blob OID');if(String.fromCharCode.apply(null,first).indexOf('version https://git-lfs.github.com/spec/v1')===0)fail('Unresolved LFS object in Parser export');var newline=A.bytes(take(1));if(newline.length!==1||newline[0]!==10)fail('Missing Parser batch payload delimiter');if($.fchmod(fd,row.mode==='100755'?493:420)!==0||$.fsync(fd)!==0)fail('Cannot preserve and sync Parser source mode');
                }finally{if(writer)writer.closeFile;else $.close(fd);}
            });if(Number(take(1).length)!==0)fail('Unexpected trailing Parser batch data');A.fsync(destination);
        }finally{handle.closeFile;}
    }
    P.init = function (source,stage,commit,toolsSha) {
        A.noLinks(source);A.noLinks(stage);source=A.real(source);stage=A.real(stage);checkSeparate([source,stage]);empty(stage);oid(toolsSha);
        var format=sourceCheck(source,commit),pins=inputHashes(source,commit);exportRows(source,commit);
        A.mkdir(stage);var r={contract:contract(commit,format),source:source,tools_commit:toolsSha,source_inputs:pins,fresh_staging:true,stage_id:A.uuid(),started_at:new Date().toISOString(),exports:{},completed:{}};
        A.exclusiveJSON(stage+'/'+receiptName,r);A.mkdir(stage+'/db');A.mkdir(stage+'/.contrib/.db/shared/constants');
        flavors.forEach(function (f) { A.exclusiveJSON(stage+'/.contrib/new-cd-'+f+'.config',{'root-addon':stage,'db-relative':roots[f]+'/'}); });return r;
    };
    P.exportSource = function (stage,flavor,destination) {
        var r=readReceipt(stage);if(flavors.indexOf(flavor)<0||r.exports[flavor]||r.completed[flavor])fail('Fresh export required for one declared, uncompleted flavor');
        stage=A.real(stage);A.noLinks(destination);destination=A.real(destination);checkSeparate([r.source,stage,destination]);Object.keys(r.exports).forEach(function(f){if(A.overlap(destination,r.exports[f].path))fail('Each flavor needs a separate fresh Parser source export');});empty(destination);
        if(A.exists(stage+'/db/'+roots[flavor]))fail('Flavor output existed before fresh source export');
        var expected=exportRows(r.source,r.contract.commit),batchRoot=A.mkdir(parent(destination)+'/.att-parser-batch-'+A.uuid()),request=batchRoot+'/request',raw=batchRoot+'/raw';
        try {
            A.writeBytes(request,expected.map(function(row){return row.oid+'\n';}).join(''),true);var result=A.exec(['/usr/bin/git','--no-optional-locks','cat-file','--batch'],r.source,{stdinFile:request,maxInputBytes:2*1024*1024,stdoutFile:raw,maxFileOutput:limits.maxTotalBytes,timeoutMilliseconds:900000,env:{GIT_TERMINAL_PROMPT:'0',GIT_OPTIONAL_LOCKS:'0',GIT_NO_REPLACE_OBJECTS:'1'}});if(result.code!==0||A.size(raw)>limits.maxTotalBytes)fail('Cannot read bounded pinned Parser blobs');
            A.mkdir(destination);readBatch(raw,destination,expected,r.contract.git_object_format);
            var files=inventory(destination,false);if(!same(Object.keys(files).sort(),expected.map(function(row){return row.path;})))fail('Exported Parser source differs from exact Git blob file set');
            r.exports[flavor]={path:destination,files:files,exported_at:new Date().toISOString(),source_commit:r.contract.commit,export_method:'git-cat-file-batch-raw-blobs'};A.atomicJSON(stage+'/'+receiptName,r);
            var command=[destination+'/'+parserPath,'auto','baseconfig='+destination+'/'+baseConfig];if(configs[flavor])command.push('config='+destination+'/'+configs[flavor]);command.push('config='+stage+'/.contrib/new-cd-'+flavor+'.config');
            return {flavor:flavor,source_commit:r.contract.commit,parser_source:destination,cwd:destination+'/.contrib/.tools',command:command,output_root:stage+'/db/'+roots[flavor],assurance:'Source export verified; Parser has not been executed by this tool'};
        } finally { A.remove(batchRoot); }
    };
    function exportUnchanged(r,flavor) {
        var exported=r.exports[flavor];if(!exported||exported.source_commit!==r.contract.commit||typeof exported.path!=='string')fail('Missing exact fresh Parser source export');checkSeparate([r.source,exported.path]);
        if(!same(inventory(exported.path,false),exported.files))fail('Parser source export changed after preparation');
    }
    P.complete = function (stage,flavor,declaredSuccess) {
        var r=readReceipt(stage);if(flavors.indexOf(flavor)<0||r.completed[flavor]||declaredSuccess!==true)fail('One explicit caller success declaration required for an uncompleted flavor');exportUnchanged(r,flavor);
        var files=own(inventory(A.real(stage)+'/db',true),roots[flavor]);required(files,roots[flavor]);r.completed[flavor]={files:files,completed_at:new Date().toISOString(),assurance:'caller-declared-generator-succeeded; this tool did not execute Parser'};A.atomicJSON(A.real(stage)+'/'+receiptName,r);return r.completed[flavor];
    };
    function closure(db,start,files) {
        var seen=Object.create(null),active=Object.create(null);
        function visit(path) {
            if(active[path])fail('Cyclic XML include');if(seen[path])return;if(!files[path])fail('Missing or case-mismatched XML dependency: '+path);seen[path]=true;
            if(!/\.xml$/i.test(path))return;active[path]=true;var text=A.readText(db+'/'+path,limits.maxFileBytes);if(/\x00|<!DOCTYPE|<!ENTITY/i.test(text))fail('DTD and XML entities are not allowed');
            var error=Ref(),doc=$.NSXMLDocument.alloc.initWithXMLStringOptionsError(text,0,error);if(!doc||!doc.rootElement||ObjC.unwrap(doc.rootElement.name)===undefined)fail('Malformed XML');
            var nodes=doc.nodesForXPathError("//*[local-name()='Script' or local-name()='Include']",Ref());if(!nodes||!isFinite(Number(nodes.count))||Number(nodes.count)>100000)fail('Cannot read bounded XML load dependencies');
            for(var i=0;i<Number(nodes.count);i++){var element=nodes.objectAtIndex(i),kind=ObjC.unwrap(element.localName),attr=element.attributeForName('file'),raw=attr?ObjC.unwrap(attr.stringValue):null;if(typeof raw!=='string'||!raw||/^[\\/]|:|\x00/.test(raw))fail('Invalid XML file reference');var parts=path.split('/');parts.pop();raw.replace(/\\/g,'/').split('/').forEach(function(p){if(p==='.')return;if(p==='..'){if(!parts.length)fail('XML dependency escaped DB root');parts.pop();}else parts.push(p);});var target=portable(parts.join('/'));if(!(kind==='Include'?/\.xml$/i:/\.lua$/i).test(target))fail('Invalid XML dependency type');visit(target);}
            delete active[path];
        }
        visit(start);return Object.keys(seen).sort();
    }
    function packagePreflight(stage) {
        var r=readReceipt(stage),db=A.real(stage)+'/db',files=inventory(db,true);if(!same(Object.keys(r.completed).sort(),flavors.slice().sort()))fail('Every one of the eight flavors requires a completion receipt');
        var products=[],union=Object.create(null),allowedRoots=flavors.map(function(f){return roots[f];});Object.keys(files).forEach(function(p){if(allowedRoots.indexOf(p.split('/')[0])<0)fail('Undeclared generated DB root');});
        flavors.forEach(function(f){exportUnchanged(r,f);var ownFiles=own(files,roots[f]);required(ownFiles,roots[f]);if(!same(ownFiles,r.completed[f].files))fail('DB changed after flavor completion');var paths=Object.create(null);Object.keys(ownFiles).forEach(function(p){paths[p]=true;if(/\.xml$/i.test(p))closure(db,p,files).forEach(function(q){paths[q]=true;});});var list=Object.keys(paths).sort();list.forEach(function(p){union[p]=true;});products.push({flavor:f,root:roots[f],profile:'new-cd-'+f+'-auto',recipe:recipe,files:list});});
        if(!same(Object.keys(union).sort(),Object.keys(files).sort()))fail('Product union does not exactly cover generated files');return {receipt:r,db:db,files:files,products:products};
    }
    P.packageStage = function (stage,output) {
        var checked=packagePreflight(stage),r=checked.receipt,db=checked.db,files=checked.files;A.noLinks(output);output=A.real(output);checkSeparate([r.source,A.real(stage),output]);Object.keys(r.exports).forEach(function(f){if(A.overlap(output,r.exports[f].path))fail('Output overlaps a Parser source export');});empty(output);
        var scratch=A.mkdir(parent(output)+'/.att-package-'+A.uuid()),copy=A.mkdir(scratch+'/db'),prefix='db-'+r.contract.git_object_format+'-'+r.contract.commit,archive=scratch+'/'+prefix+'.zip',manifest=scratch+'/'+prefix+'.sha256',metadata=scratch+'/'+prefix+'.metadata.json';
        try {
            var names=Object.keys(files).sort();names.forEach(function(p){var bytes=A.readBytes(db+'/'+p,limits.maxFileBytes);if(Number(bytes.length)!==files[p].size||A.hashBytes(bytes)!==files[p].sha256)fail('DB changed during packaging');A.writeBytes(copy+'/'+p,bytes,true);if($.chmod(copy+'/'+p,420)!==0)fail('Cannot set portable ZIP file mode');});
            for(var index=0;index<names.length;index+=128){var touched=A.exec(['/usr/bin/touch','-t','198001010000'].concat(names.slice(index,index+128).map(function(p){return copy+'/'+p;})),undefined,{env:{TZ:'UTC'}});if(touched.code!==0)fail('Cannot set deterministic archive date');}
            A.writeBytes(scratch+'/paths',names.join('\n')+'\n',true);var command='ulimit -f 524288 || exit 1; exec /usr/bin/zip -X -q -9 '+A.shellQuote(archive)+' -@ < '+A.shellQuote(scratch+'/paths'),result=A.exec(['/bin/sh','-c',command],copy,{env:{TZ:'UTC'},timeoutMilliseconds:900000,monitoredFiles:[{path:archive,maxBytes:limits.maxArchiveBytes}]});if(result.code!==0||!A.regular(archive)||A.size(archive)>limits.maxArchiveBytes)fail('ZIP packaging failed or exceeded archive limit');
            var manifestText=names.map(function(p){return files[p].sha256+'  '+p+'\n';}).join('');A.writeBytes(manifest,manifestText,true);
            if(!same(inventory(db,true),files))fail('DB changed during packaging');var requiredFlavors=flavors.slice().sort(),document={schema:2,repository:repository,commit:r.contract.commit,git_object_format:r.contract.git_object_format,archive:{name:name(archive),sha256:A.hashFile(archive),size:A.size(archive)},manifest:{name:name(manifest),sha256:A.hashFile(manifest),size:A.size(manifest)},products:checked.products,files:files,producer:{tool:'att-package.js (system JXA)',fresh_staging:true,stage_id:r.stage_id,started_at:r.started_at,required_flavors:requiredFlavors,completed_flavors:requiredFlavors,completion:'caller-declared-generator-succeeded; Parser was not executed by this tool'},new_cd:{recipe:recipe,tools_commit:r.tools_commit,source_commit:r.contract.commit,source_inputs:r.source_inputs}};
            A.writeBytes(metadata,A.canonical(document)+'\n',true);if(typeof A.verifyAndExtract!=='function')fail('Schema 2 artifact validator is required');var verify=scratch+'/verified';A.verifyAndExtract(archive,manifest,metadata,verify,A.identity({commit:r.contract.commit,object_format:r.contract.git_object_format,flavor:'retail',profile:'new-cd-retail-auto',recipe:recipe}),{});
            A.mkdir(output);[archive,manifest,metadata].forEach(function(p){A.writeBytes(output+'/'+name(p),A.readBytes(p,p===archive?limits.maxArchiveBytes:16*1024*1024),true);});A.fsync(output);return document;
        } finally { A.remove(scratch); }
    };
    function options(argv) {
        var result={};for(var i=0;i<argv.length;i++){if(typeof argv[i]!=='string'||argv[i].indexOf('--')!==0)fail('Named producer option required');var key=argv[i].slice(2);if(Object.prototype.hasOwnProperty.call(result,key))fail('Duplicate producer option');if(key==='generator-succeeded')result[key]=true;else{if(++i>=argv.length)fail('Missing producer option value');result[key]=argv[i];}}return result;
    }
    function exact(opts,keys) { if(!same(Object.keys(opts).sort(),keys.slice().sort()))fail('Unexpected or missing producer options'); }
    function locked(stage,callback) {
        A.noLinks(stage);stage=A.real(stage);var lock=stage+'.att-package.lock';A.noLinks(lock);A.mkdir(parent(lock));if(!A.exists(lock)){try{A.writeBytes(lock,'ATT producer stage lock\n',true);}catch(error){if(!A.regular(lock)||A.readText(lock,128)!=='ATT producer stage lock\n')throw error;}}if(!A.regular(lock)||A.readText(lock,128)!=='ATT producer stage lock\n')fail('Foreign producer lock path');
        if(typeof A.withLock!=='function')fail('Native bounded producer lock support is required');return A.withLock(lock,30000,callback);
    }
    P.bind=function(core){A=core;return P;};
    P.cli=function(argv){if(argv.length===1&&argv[0]==='--help')return 'macOS system-JXA producer (does not execute Parser or publish)\ninit --source CLEAN_REPOSITORY --stage FRESH_STAGE --expected-sha FULL_SHA --tools-sha FULL_TOOLS_SHA\nexport --stage FRESH_STAGE --flavor FLAVOR --destination FRESH_PARSER_SOURCE\ncomplete --stage FRESH_STAGE --flavor FLAVOR --generator-succeeded\npackage --stage FRESH_STAGE --output FRESH_OUTPUT\nAll eight flavors require separate source exports and caller-declared completion. Use the existing net48 Parser separately; a declaration does not verify its execution.';
        var command=argv[0],o=options(argv.slice(1)),value;
        if(command==='init'){exact(o,['source','stage','expected-sha','tools-sha']);A.noLinks(o.source);A.noLinks(o.stage);checkSeparate([o.source,o.stage]);empty(o.stage);oid(o['tools-sha']);sourceCheck(o.source,o['expected-sha']);value=locked(o.stage,function(){return P.init(o.source,o.stage,o['expected-sha'],o['tools-sha']);});}
        else if(command==='export'||command==='complete'||command==='package'){exact(o,command==='export'?['stage','flavor','destination']:command==='complete'?['stage','flavor','generator-succeeded']:['stage','output']);var receipt=readReceipt(o.stage);checkSeparate([receipt.source,o.stage]);value=locked(o.stage,function(){if(command==='export')return P.exportSource(o.stage,o.flavor,o.destination);if(command==='complete')return P.complete(o.stage,o.flavor,true);return P.packageStage(o.stage,o.output);});}
        else fail('Producer init|export|complete|package command required');return A.canonical(value);};
    return P;
}());
function run(argv) {
    ObjC.import('Foundation');var argumentsArray=ObjC.deepUnwrap($.NSProcessInfo.processInfo.arguments),script=null;
    for(var i=0;i<argumentsArray.length;i++)if(/(?:^|\/)att-package\.js$/.test(argumentsArray[i]))script=argumentsArray[i];if(!script)throw new Error('Cannot determine producer script directory');
    var dir=ObjC.unwrap($(script).stringByDeletingLastPathComponent),fm=$.NSFileManager.defaultManager;
    [script,dir+'/att-core.js',dir+'/att-artifact.js'].forEach(function(path){var absolute=path[0]==='/'?path:ObjC.unwrap(fm.currentDirectoryPath)+'/'+path,parts=absolute.split('/'),current='';for(var j=1;j<parts.length;j++){if(!parts[j]||parts[j]==='.')continue;if(parts[j]==='..')throw new Error('Producer path must not contain parent traversal');current+='/'+parts[j];var attrs=ObjC.deepUnwrap(fm.attributesOfItemAtPathError(current,Ref()));if(!attrs||attrs.NSFileType==='NSFileTypeSymbolicLink'||(j<parts.length-1&&attrs.NSFileType!=='NSFileTypeDirectory')||(j===parts.length-1&&(attrs.NSFileType!=='NSFileTypeRegular'||Number(attrs.NSFileSize)>2*1024*1024)))throw new Error('Producer scripts must be bounded regular files without linked path components');}});
    (0,eval)(ObjC.unwrap($.NSString.stringWithContentsOfFileEncodingError(dir+'/att-core.js',$.NSUTF8StringEncoding,Ref())));ATT.noLinks(dir);ATT.load(dir+'/att-artifact.js');return ATTProducer.bind(ATT).cli(argv);
}
