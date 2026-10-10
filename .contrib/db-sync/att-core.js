/* ATT macOS script primitives. Evaluating this file has no CLI side effects. */
ObjC.import('Foundation');
ObjC.bindFunction('realpath',['char *',['char *','void *']]);
ObjC.bindFunction('renamex_np',['int',['char *','char *','unsigned int']]);
ObjC.bindFunction('kill',['int',['int','int']]);
ObjC.bindFunction('fstat',['int',['int','void *']]);
ObjC.bindFunction('flock',['int',['int','int']]);
ObjC.bindFunction('CC_SHA256',['void *',['void *','unsigned int','void *']]);
ObjC.bindFunction('CC_SHA256_Init',['int',['void *']]);
ObjC.bindFunction('CC_SHA256_Update',['int',['void *','void *','unsigned int']]);
ObjC.bindFunction('CC_SHA256_Final',['int',['void *','void *']]);
['open','close','fsync','rename','link','unlink','symlink','chmod'].forEach(function (name) {
    var declarations = {
        open:['int',['char *','int']], close:['int',['int']], fsync:['int',['int']],
        rename:['int',['char *','char *']], link:['int',['char *','char *']],
        unlink:['int',['char *']], symlink:['int',['char *','char *']], chmod:['int',['char *','int']]
    };
    ObjC.bindFunction(name, declarations[name]);
});
var ATT = (function () {
    var A = {}, fm = $.NSFileManager.defaultManager;
    A.fail = function (message) { throw new Error(message); };
    A.uuid = function () { return ObjC.unwrap($.NSUUID.UUID.UUIDString).toLowerCase().replace(/-/g,''); };
    A.join = function () { return Array.prototype.slice.call(arguments).join('/').replace(/\/+/g,'/'); };
    A.shellQuote = function (s) { return "'" + String(s).replace(/'/g,"'\\''") + "'"; };
    A.attributes = function (p) {
        var e=Ref(), value=fm.attributesOfItemAtPathError(String(p),e);
        var result=ObjC.deepUnwrap(value);return result&&typeof result==='object'?result:null;
    };
    A.exists = function (p) { return A.attributes(p)!==null; };
    A.isLink = function (p) { var a=A.attributes(p);return !!a && a.NSFileType==='NSFileTypeSymbolicLink'; };
    A.regular = A.isRegular = function (p,directory) {
        var a=A.attributes(p);return !!a && a.NSFileType===(directory?'NSFileTypeDirectory':'NSFileTypeRegular');
    };
    A.size = function (p) { var a=A.attributes(p);if(!a || a.NSFileType!=='NSFileTypeRegular') A.fail('Expected regular file: '+p);return Number(a.NSFileSize); };
    A.location = function (p) {
        p=String(p);if(p[0]!=='/')p=ObjC.unwrap(fm.currentDirectoryPath)+'/'+p;
        var result=[];p.split('/').forEach(function(part){if(!part||part==='.')return;if(part==='..'){result.pop();return;}result.push(part);});return '/'+result.join('/');
    };
    A.real = A.realPath = function(p) { p=A.location(p);var parts=[];while(!A.exists(p)&&p!=='/'){parts.unshift(ObjC.unwrap($(p).lastPathComponent));p=ObjC.unwrap($(p).stringByDeletingLastPathComponent);}var result=String($.realpath(p,null));return parts.length?result.replace(/\/$/,'')+'/'+parts.join('/'):result; };
    A.readLink=function(p){if(!A.isLink(p))A.fail('Expected symbolic link');var result=ObjC.unwrap(fm.destinationOfSymbolicLinkAtPathError(String(p),Ref()));if(typeof result!=='string')A.fail('Cannot read symbolic link');return result;};
    A.noLinks = function (p) {
        var full=A.location(p),parts=full.split('/'),current='';
        for(var i=1;i<parts.length;i++){current+='/'+parts[i];if(A.isLink(current))A.fail('Symlink path component: '+current);if(i<parts.length-1&&A.exists(current)&&!A.regular(current,true))A.fail('Non-directory path component');}
    };
    A.overlap = function (a,b) {
        a=A.real(a).normalize('NFC').toLowerCase().replace(/\/$/,'');b=A.real(b).normalize('NFC').toLowerCase().replace(/\/$/,'');
        return a===b || a.indexOf(b+'/')===0 || b.indexOf(a+'/')===0;
    };
    A.safeRelative = function (p) {
        if(typeof p!=='string'||!p||p.length>1024||p[0]==='/'||/[\\:\x00-\x1f\x7f<>"|?*]/.test(p))A.fail('Unsafe relative path');
        p.split('/').forEach(function(x){if(!x||x==='.'||x==='..'||/[. ]$/.test(x)||/^(CON|PRN|AUX|NUL|COM[1-9]|LPT[1-9])(?:\.|$)/i.test(x))A.fail('Unsafe path component');});
        return p;
    };
    A.mkdir = function(p) {
        p=A.location(p);A.noLinks(p);if(A.exists(p)){if(!A.regular(p,true))A.fail('Expected directory');return p;}
        if(!fm.createDirectoryAtPathWithIntermediateDirectoriesAttributesError(p,true,{NSFilePosixPermissions:448},Ref()))A.fail('Cannot create directory');
        A.noLinks(p);return p;
    };
    A.remove = function(p) { if(A.exists(p)&&!fm.removeItemAtPathError(String(p),Ref()))A.fail('Cannot remove owned temporary path'); };
    A.walk = A.listFiles = function(root) {
        A.noLinks(root);if(!A.regular(root,true))A.fail('Expected regular directory');var rows=[];
        function visit(p,rel){var names=ObjC.deepUnwrap(fm.contentsOfDirectoryAtPathError(p,Ref()));if(!names)A.fail('Cannot list directory');names.sort().forEach(function(n){var path=p+'/'+n,r=rel?rel+'/'+n:n,a=A.attributes(path);if(!a)A.fail('Vanished file');var type=a.NSFileType==='NSFileTypeDirectory'?'directory':a.NSFileType==='NSFileTypeRegular'?'file':a.NSFileType==='NSFileTypeSymbolicLink'?'link':'special';rows.push({path:path,relative:r,type:type,size:Number(a.NSFileSize)});if(type==='directory')visit(path,r);});}
        visit(String(root),'');return rows;
    };
    var alphabet='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
    A.bytes=function(data){var s=ObjC.unwrap(data.base64EncodedStringWithOptions(0)),out=[];for(var i=0;i<s.length;i+=4){var a=alphabet.indexOf(s[i]),b=alphabet.indexOf(s[i+1]),c=alphabet.indexOf(s[i+2]),d=alphabet.indexOf(s[i+3]);out.push((a<<2)|(b>>4));if(s[i+2]!=='=')out.push(((b&15)<<4)|(c>>2));if(s[i+3]!=='=')out.push(((c&3)<<6)|d);}return out;};
    A.nsdata=function(value){
        if(typeof value==='string')return $(value).dataUsingEncoding($.NSUTF8StringEncoding);
        if(Array.isArray(value)){var s='';for(var i=0;i<value.length;i+=3){var a=value[i],b=value[i+1],c=value[i+2];s+=alphabet[a>>2]+alphabet[((a&3)<<4)|((b||0)>>4)]+(i+1<value.length?alphabet[((b&15)<<2)|((c||0)>>6)]:'=')+(i+2<value.length?alphabet[c&63]:'=');}return $.NSData.alloc.initWithBase64EncodedStringOptions(s,0);}
        return value;
    };
    A.openRead=function(p){A.noLinks(p);if(!A.regular(p))A.fail('Expected regular file');var fd=$.open(String(p),0|256|4|16777216);if(fd<0)A.fail('Cannot open regular file');var stat=$.NSMutableData.dataWithLength(512);if($.fstat(fd,stat.mutableBytes)!==0){$.close(fd);A.fail('Cannot stat open file');}var mode=A.bytes(stat.subdataWithRange($.NSMakeRange(4,2)));if(((mode[0]+mode[1]*256)&61440)!==32768){$.close(fd);A.fail('Open file is not regular');}return $.NSFileHandle.alloc.initWithFileDescriptorCloseOnDealloc(fd,true);};
    A.withLock=function(p,timeoutMilliseconds,callback){A.noLinks(p);if(!A.regular(p)||typeof callback!=='function'||typeof timeoutMilliseconds!=='number'||!isFinite(timeoutMilliseconds)||Math.floor(timeoutMilliseconds)!==timeoutMilliseconds||timeoutMilliseconds<0||timeoutMilliseconds>180000)A.fail('Invalid lock request');var fd=$.open(String(p),2|256|4|16777216);if(fd<0)A.fail('Cannot open store lock');var held=false;try{var stat=$.NSMutableData.dataWithLength(512);if($.fstat(fd,stat.mutableBytes)!==0)A.fail('Cannot stat lock');var mode=A.bytes(stat.subdataWithRange($.NSMakeRange(4,2)));if(((mode[0]+mode[1]*256)&61440)!==32768)A.fail('Store lock is not regular');var deadline=Date.now()+timeoutMilliseconds;while($.flock(fd,2|4)!==0){if(Date.now()>=deadline)A.fail('Store lock timeout');$.NSThread.sleepForTimeInterval(0.02);}held=true;return callback();}finally{if(held)$.flock(fd,8);$.close(fd);}};
    A.readBytes=function(p,max){max=max===undefined?4*1024*1024:max;var handle=A.openRead(p);try{var size=Number(handle.seekToEndOfFile);if(size>max)A.fail('File exceeds byte limit');handle.seekToFileOffset(0);var data=handle.readDataOfLength(max+1);if(Number(data.length)!==size||Number(data.length)>max)A.fail('Cannot read bounded file');return data;}finally{handle.closeFile;}};
    A.text=function(data){var result=ObjC.unwrap($.NSString.alloc.initWithDataEncoding(data,$.NSUTF8StringEncoding));if(typeof result!=='string')A.fail('Invalid UTF-8');return result;};
    A.readText=function(p,max){return A.text(A.readBytes(p,max));};
    A.strictParse=A.strictJSON=function(text,maxDepth,maxChars){
        if(typeof text!=='string'||text.length>(maxChars===undefined?4*1024*1024:maxChars))A.fail('JSON exceeds size limit');var i=0,depthLimit=maxDepth===undefined?64:maxDepth;
        function ws(){while(i<text.length&&/[ \n\r\t]/.test(text[i]))i++;}
        function string(){var start=i++;while(i<text.length){var ch=text[i++];if(ch==='"'){var decoded=JSON.parse(text.slice(start,i));for(var j=0;j<decoded.length;j++){var cp=decoded.charCodeAt(j);if(cp>=55296&&cp<=56319){if(j+1>=decoded.length||decoded.charCodeAt(j+1)<56320||decoded.charCodeAt(j+1)>57343)A.fail('Unpaired JSON surrogate');j++;}else if(cp>=56320&&cp<=57343)A.fail('Unpaired JSON surrogate');}return decoded;}if(ch==='\\'){if(i>=text.length)break;var esc=text[i++];if(esc==='u'){if(!/^[0-9a-fA-F]{4}$/.test(text.slice(i,i+4)))A.fail('Invalid JSON escape');i+=4;}else if('"\\/bfnrt'.indexOf(esc)<0)A.fail('Invalid JSON escape');}else if(ch.charCodeAt(0)<32)A.fail('Control byte in JSON string');}A.fail('Unterminated JSON string');}
        function value(depth){if(depth>depthLimit)A.fail('JSON nesting exceeds limit');ws();var ch=text[i];if(ch==='"')return string();if(ch==='{'){i++;ws();var obj={},seen=Object.create(null);if(text[i]==='}'){i++;return obj;}while(true){ws();if(text[i]!=='"')A.fail('Invalid JSON object key');var key=string();if(seen[key])A.fail('Duplicate JSON key');seen[key]=true;ws();if(text[i++]!==':')A.fail('Missing JSON colon');var v=value(depth+1);Object.defineProperty(obj,key,{value:v,enumerable:true,writable:true,configurable:true});ws();var sep=text[i++];if(sep==='}')return obj;if(sep!==',')A.fail('Invalid JSON object separator');}}
            if(ch==='['){i++;ws();var arr=[];if(text[i]===']'){i++;return arr;}while(true){arr.push(value(depth+1));ws();var sep2=text[i++];if(sep2===']')return arr;if(sep2!==',')A.fail('Invalid JSON array separator');}}
            var rest=text.slice(i),m=/^(?:true|false|null)/.exec(rest);if(m){i+=m[0].length;return JSON.parse(m[0]);}m=/^-?(?:0|[1-9]\d*)(?:\.\d+)?(?:[eE][+-]?\d+)?/.exec(rest);if(m){i+=m[0].length;var n=Number(m[0]);if(!isFinite(n)||Math.abs(n)>9007199254740991)A.fail('JSON number outside exact range');return n;}A.fail('Invalid JSON value');}
        var result=value(0);ws();if(i!==text.length)A.fail('Trailing JSON bytes');return result;
    };
    A.readJSON=function(p,max){var data=A.readBytes(p,max),prefix=A.bytes(data.subdataWithRange($.NSMakeRange(0,Math.min(3,Number(data.length)))));if(prefix.length===3&&prefix[0]===239&&prefix[1]===187&&prefix[2]===191)A.fail('JSON must be UTF-8 without BOM');return A.strictParse(A.text(data),64,max===undefined?4*1024*1024:max);};
    A.canonical=A.canonicalJSON=function(v){if(v===null||typeof v==='string'||typeof v==='boolean')return JSON.stringify(v);if(typeof v==='number'){if(!isFinite(v)||Math.abs(v)>9007199254740991)A.fail('Invalid canonical number');return JSON.stringify(v);}if(Array.isArray(v))return '['+v.map(A.canonical).join(',')+']';if(v&&typeof v==='object')return '{'+Object.keys(v).sort().map(function(k){return JSON.stringify(k)+':'+A.canonical(v[k]);}).join(',')+'}';A.fail('Unsupported canonical value');};
    A.fsync=function(p){A.noLinks(p);if(!A.regular(p)&&!A.regular(p,true))A.fail('Cannot fsync special path');var fd=$.open(String(p),0|256|4|16777216);if(fd<0)A.fail('Cannot open path for fsync');try{var stat=$.NSMutableData.dataWithLength(512);if($.fstat(fd,stat.mutableBytes)!==0)A.fail('Cannot stat sync path');var mode=A.bytes(stat.subdataWithRange($.NSMakeRange(4,2))),type=(mode[0]+mode[1]*256)&61440;if(type!==32768&&type!==16384)A.fail('Cannot sync special open path');if($.fsync(fd)!==0)A.fail('Cannot fsync path');}finally{$.close(fd);}};
    A.writeBytes=function(p,value,exclusive){p=A.location(p);A.noLinks(p);A.mkdir(ObjC.unwrap($(p).stringByDeletingLastPathComponent));if(exclusive===undefined)exclusive=true;if(exclusive&&A.exists(p))A.fail('File already exists');if(!exclusive&&A.exists(p)&&!A.regular(p))A.fail('Cannot overwrite special path');var data=A.nsdata(value);if(!data.writeToFileOptionsError(p,exclusive?2:0,Ref()))A.fail('Cannot write file exclusively');if($.chmod(p,384)!==0)A.fail('Cannot set private file mode');A.fsync(p);return p;};
    A.rename=A.fsyncRename=function(from,to,replace){from=A.location(from);to=A.location(to);A.noLinks(from);A.noLinks(to);if(!A.exists(from))A.fail('Rename source missing');if(!A.regular(from)&&!A.regular(from,true))A.fail('Rename source is special');if(A.exists(to)&&!replace)A.fail('Rename destination exists');if(A.exists(to)&&!A.regular(to))A.fail('Cannot replace non-file');if($.renamex_np(from,to,replace?0:4)!==0)A.fail('Atomic rename failed');A.fsync(ObjC.unwrap($(to).stringByDeletingLastPathComponent));};
    A.renameLink=function(from,to,expectedOldTarget){from=A.location(from);to=A.location(to);A.noLinks(ObjC.unwrap($(from).stringByDeletingLastPathComponent));A.noLinks(ObjC.unwrap($(to).stringByDeletingLastPathComponent));if(!A.isLink(from))A.fail('New pointer must be symbolic link');if(A.exists(to)){if(typeof expectedOldTarget!=='string'||!A.isLink(to)||A.readLink(to)!==expectedOldTarget)A.fail('Existing pointer changed or is unowned');}else if(expectedOldTarget!==null)A.fail('Expected existing pointer is missing');if($.renamex_np(from,to,expectedOldTarget===null?4:0)!==0)A.fail('Atomic pointer rename failed');A.fsync(ObjC.unwrap($(to).stringByDeletingLastPathComponent));};
    A.symlink=function(link,target){A.noLinks(link);if(A.exists(link))A.fail('Symlink destination exists');if($.symlink(String(target),String(link))!==0)A.fail('Cannot create symlink');A.fsync(ObjC.unwrap($(link).stringByDeletingLastPathComponent));};
    A.atomicJSON=function(p,value){A.noLinks(p);var parent=ObjC.unwrap($(A.location(p)).stringByDeletingLastPathComponent);A.mkdir(parent);var temp=parent+'/.att-json-'+A.uuid();try{A.writeBytes(temp,A.canonical(value)+'\n',true);A.rename(temp,p,true);}finally{A.remove(temp);}return value;};
    A.exclusiveJSON=function(p,value){A.noLinks(p);var parent=ObjC.unwrap($(A.location(p)).stringByDeletingLastPathComponent);A.mkdir(parent);var temp=parent+'/.att-exclusive-'+A.uuid();try{A.writeBytes(temp,A.canonical(value)+'\n',true);if($.link(temp,String(p))!==0)A.fail('Exclusive file creation failed');A.fsync(parent);}finally{A.remove(temp);}return value;};
    A.exec=function(argv,cwd,options){
        options=options||{};if(!Array.isArray(argv)||!argv.length)A.fail('Missing command argv');var monitored=options.monitoredFiles||[];if(!Array.isArray(monitored))A.fail('Invalid output monitors');monitored.forEach(function(m){if(!m||typeof m.path!=='string'||typeof m.maxBytes!=='number'||!isFinite(m.maxBytes)||m.maxBytes<=0||Math.floor(m.maxBytes)!==m.maxBytes||m.maxBytes>1024*1024*1024)A.fail('Invalid output monitor');A.noLinks(m.path);});function monitoredOver(){return monitored.some(function(m){return A.exists(m.path)&&(!A.regular(m.path)||A.size(m.path)>m.maxBytes);});}var temp=A.mkdir(A.real(ObjC.unwrap($.NSTemporaryDirectory()))+'/att-process-'+A.uuid()),out=options.stdoutFile||temp+'/stdout',err=temp+'/stderr';A.writeBytes(out,'',true);A.writeBytes(err,'',true);
        var task=$.NSTask.alloc.init;task.launchPath=String(argv[0]);task.arguments=argv.slice(1).map(String);if(cwd)task.currentDirectoryPath=A.real(cwd);
        var env=ObjC.deepUnwrap($.NSProcessInfo.processInfo.environment);['BASH_ENV','ENV','CDPATH','IFS','SHELLOPTS','BASHOPTS','ZIPOPT','UNZIP','UNZIPOPT'].forEach(function(k){delete env[k];});var gitTask=/(?:^|\/)git$/.test(argv[0]);if(gitTask)['GIT_DIR','GIT_COMMON_DIR','GIT_WORK_TREE','GIT_INDEX_FILE','GIT_OBJECT_DIRECTORY','GIT_ALTERNATE_OBJECT_DIRECTORIES','GIT_CONFIG_COUNT','GIT_CONFIG_PARAMETERS','GIT_NAMESPACE'].forEach(function(k){delete env[k];});if(options.env)Object.keys(options.env).forEach(function(k){if(options.env[k]===null)delete env[k];else env[k]=String(options.env[k]);});if(gitTask)env.GIT_NO_REPLACE_OBJECTS='1';task.environment=env;
        var oh=$.NSFileHandle.fileHandleForWritingAtPath(out),eh=$.NSFileHandle.fileHandleForWritingAtPath(err),ih=null;task.standardOutput=oh;task.standardError=eh;
        try{if(options.stdinFile){if(typeof options.stdinFile!=='string'||options.stdinFile[0]!=='/')A.fail('Child input must be an absolute regular file');var maxInput=options.maxInputBytes===undefined?8*1024*1024:options.maxInputBytes;if(typeof maxInput!=='number'||!isFinite(maxInput)||maxInput<=0||Math.floor(maxInput)!==maxInput||maxInput>1024*1024*1024)A.fail('Invalid child input limit');ih=A.openRead(options.stdinFile);if(Number(ih.seekToEndOfFile)>maxInput)A.fail('Child input exceeds byte limit');ih.seekToFileOffset(0);task.standardInput=ih;}task.launch;var deadline=Date.now()+(options.timeoutMilliseconds||300000),max=options.maxOutput||32*1024*1024,maxFile=options.maxFileOutput||max;while(task.running){var timeOver=Date.now()>deadline,outputOver=A.size(out)>(options.stdoutFile?maxFile:max)||A.size(err)>max||monitoredOver();if(timeOver||outputOver){$.kill(Number(task.processIdentifier),9);task.waitUntilExit;A.fail(timeOver?'Child time limit exceeded':'Child output limit exceeded');}$.NSThread.sleepForTimeInterval(0.02);}task.waitUntilExit;oh.closeFile;eh.closeFile;if(A.size(out)>(options.stdoutFile?maxFile:max)||A.size(err)>max||monitoredOver())A.fail('Child output limit exceeded');var result={code:Number(task.terminationStatus),stdout:options.stdoutFile?'':A.readText(out,max),stderr:A.readText(err,max)};return result;}finally{try{oh.closeFile;eh.closeFile;if(ih)ih.closeFile;}catch(ignore){}A.remove(temp);}
    };
    A.git=function(source,args){var env={GIT_TERMINAL_PROMPT:'0',GIT_OPTIONAL_LOCKS:'0',GIT_DIR:null,GIT_COMMON_DIR:null,GIT_WORK_TREE:null,GIT_INDEX_FILE:null,GIT_OBJECT_DIRECTORY:null,GIT_ALTERNATE_OBJECT_DIRECTORIES:null,GIT_CONFIG_COUNT:null,GIT_CONFIG_PARAMETERS:null};var r=A.exec(['/usr/bin/git','--no-optional-locks','-c','core.fsmonitor=false','-c','core.untrackedCache=false'].concat(args),source,{env:env});if(r.code!==0)A.fail('Git command failed: '+r.stderr.trim());return r.stdout;};
    function hex(data){return A.bytes(data).map(function(n){return ('0'+n.toString(16)).slice(-2);}).join('');}
    A.hashFile=function(p){var handle=A.openRead(p),ctx=$.NSMutableData.dataWithLength(128),out=$.NSMutableData.dataWithLength(32),total=0;try{if($.CC_SHA256_Init(ctx.mutableBytes)!==1)A.fail('SHA256 init failed');while(true){var data=handle.readDataOfLength(1024*1024),count=Number(data.length);if(!count)break;total+=count;if(total>1024*1024*1024)A.fail('Hash file exceeds byte limit');if($.CC_SHA256_Update(ctx.mutableBytes,data.bytes,count)!==1)A.fail('SHA256 update failed');}if($.CC_SHA256_Final(out.mutableBytes,ctx.mutableBytes)!==1)A.fail('SHA256 final failed');return hex(out);}finally{handle.closeFile;}};
    A.hashBytes=function(value){var data=A.nsdata(value);if(Number(data.length)>1024*1024*1024)A.fail('Hash input exceeds byte limit');var out=$.NSMutableData.dataWithLength(32);$.CC_SHA256(data.bytes,Number(data.length),out.mutableBytes);return hex(out);};
    A.identity=function(obj){if(!obj||Array.isArray(obj)||typeof obj!=='object'||Object.keys(obj).sort().join(',')!=='commit,flavor,object_format,profile,recipe')A.fail('Identity requires exactly five fields');if(obj.object_format!=='sha1'&&obj.object_format!=='sha256')A.fail('Unsupported Git object format');if(typeof obj.commit!=='string'||!(obj.object_format==='sha1'?/^[0-9a-f]{40}$/:/^[0-9a-f]{64}$/).test(obj.commit))A.fail('Identity requires full lowercase Git SHA');['flavor','profile','recipe'].forEach(function(k){if(typeof obj[k]!=='string'||!/^[A-Za-z0-9][A-Za-z0-9_.-]{0,127}$/.test(obj[k])||obj[k]==='.'||obj[k]==='..')A.fail('Invalid identity token');});return {commit:obj.commit,object_format:obj.object_format,flavor:obj.flavor,profile:obj.profile,recipe:obj.recipe};};
    A.identityKey=function(obj){return A.hashBytes(A.canonical(A.identity(obj)));};
    A.load=function(path){A.noLinks(path);(0,eval)(A.readText(path,2*1024*1024));};
    return A;
}());
function run(argv) {
    var argumentsArray=ObjC.deepUnwrap($.NSProcessInfo.processInfo.arguments),script=null;
    for(var i=0;i<argumentsArray.length;i++)if(/(?:^|\/)att-core\.js$/.test(argumentsArray[i]))script=argumentsArray[i];
    if(!script)ATT.fail('Cannot determine trusted script directory');ATT.base=ObjC.unwrap($(ATT.real(script)).stringByDeletingLastPathComponent);
    ['att-artifact.js','att-snapshot.js','att-store.js'].forEach(function(name){ATT.load(ATT.base+'/'+name);});
    if(typeof ATT.cli!=='function')ATT.fail('CLI module unavailable');var result=ATT.cli(argv);return typeof result==='string'?result:JSON.stringify(result);
}
