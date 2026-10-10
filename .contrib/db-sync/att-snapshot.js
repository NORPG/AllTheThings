/* System JXA snapshot builder. Load after att-core.js; this file never runs a CLI. */
(function (A) {
    'use strict';
    var MANIFEST = '.att-managed/manifest.json';
    var ROOTS = {retail:'Standard',era:'Vanilla',sod:'VanillaSOD',tbc:'TBC',wrath:'Wrath',cata:'Cata',mists:'Mists',forever:'Camelot'};
    var DIRS = ['src','lib','locales','assets'];
    var SUFFIX = /\.(toc|lua|xml|blp|tga|png|jpe?g|gif|ogg|mp3|wav)$/i;
    var MAX_SOURCE = 256 * 1024 * 1024, MAX_FILE = 128 * 1024 * 1024;
    function error(s) { throw new Error('Snapshot: ' + s); }
    function keys(v) { return Object.keys(v).sort(); }
    function object(v) { return v !== null && typeof v === 'object' && !Array.isArray(v); }
    function exact(v, expected) { return object(v) && keys(v).join('\0') === expected.slice().sort().join('\0'); }
    function sameKeys(a,b) { return keys(a).join('\0') === keys(b).join('\0'); }
    function own(v,k) { return Object.prototype.hasOwnProperty.call(v,k); }
    function safe(name) { try { return A.safeRelative(name); } catch (e) { error('unsafe relative file path: ' + name); } }
    function folded(name) { return name.normalize('NFC').toLowerCase(); }
    function runtime(name, includeDb) {
        var parts = name.replace(/\\/g,'/').split('/').filter(function(p){return p !== '';});
        return parts.length > 0 && (DIRS.indexOf(parts[0]) >= 0 || includeDb && parts[0] === 'db' ||
            parts.length === 1 && (SUFFIX.test(parts[0]) || /^(LICENSE|license\.txt)$/i.test(parts[0])));
    }
    function game(id) { if (!own(ROOTS,id.flavor)) error('unsupported flavor: ' + id.flavor); return ROOTS[id.flavor]; }
    function lines(text) { return text.replace(/\r\n/g,'\n').replace(/\r/g,'\n').split('\n'); }
    function tocText(path) { return A.readText(path,MAX_FILE).replace(/^\ufeff/,''); }
    function inventory(root) {
        if (!A.regular(root,true) || A.isLink(root)) error('payload root must be a real directory');
        var files = Object.create(null), aliases = Object.create(null);
        A.walk(root).forEach(function(entry){
            var name = safe(entry.relative), alias = folded(name);
            if (own(aliases,alias)) error('case or Unicode colliding payload paths');
            aliases[alias] = true;
            if (entry.type === 'directory') { if (!A.regular(entry.path,true)) error('unsafe payload directory: ' + name); }
            else {
                if (!A.regular(entry.path,false) || A.isLink(entry.path)) error('payload contains a non-regular file: ' + name);
                files[name] = entry.path;
            }
        });
        return files;
    }
    function fileInfo(path) { return {sha256:A.hashFile(path),size:A.size(path)}; }
    function clean(source) {
        var flags = A.git(source,['ls-files','-v','-z']).split('\0');
        flags.forEach(function(entry){
            if (entry.length >= 3 && runtime(entry.slice(2),true) && (entry[0] === 'S' || /[a-z]/.test(entry[0])))
                error('runtime index flags hide local changes: ' + entry.slice(2));
        });
        var status = A.git(source,['status','--porcelain=v1','-z','--untracked-files=all','--ignored=matching']).split('\0');
        var dirty = Object.create(null);
        for (var i=0;i<status.length;i++) {
            var entry=status[i]; if (!entry) continue;
            if (entry.length < 4) error('invalid Git status response');
            if (runtime(entry.slice(3),true)) dirty[entry.slice(3)]=true;
            if (/[RC]/.test(entry.slice(0,2))) {
                i++; if (i>=status.length || !status[i]) error('invalid Git rename status response');
                if (runtime(status[i],true)) dirty[status[i]]=true;
            }
        }
        if (keys(dirty).length) error('local runtime or DB changes must be preserved: '+keys(dirty).join(', '));
    }
    function utf8(bytes) {
        var value=ObjC.unwrap($.NSString.alloc.initWithDataEncoding(A.nsdata(bytes),$.NSUTF8StringEncoding));
        if (typeof value !== 'string') error('archive text is not UTF-8');
        return value;
    }
    function field(bytes,start,length) {
        var out=bytes.slice(start,start+length), zero=out.indexOf(0); if (zero>=0) out=out.slice(0,zero);
        return utf8(out);
    }
    function octal(bytes,start,length) {
        var text=field(bytes,start,length).trim();
        if (!/^[0-7]+$/.test(text)) error('unsupported or invalid TAR numeric field');
        var value=parseInt(text,8); if (!Number.isSafeInteger(value)) error('TAR size is not bounded'); return value;
    }
    function portion(data,offset,length) { return data.subdataWithRange($.NSMakeRange(offset,length)); }
    function pax(data) {
        var bytes=A.bytes(data), result=Object.create(null), position=0;
        if (bytes.length>65536) error('oversized TAR extended attributes');
        while(position<bytes.length) {
            var space=bytes.indexOf(32,position); if(space<0 || space-position>12) error('invalid PAX record');
            var lengthText=utf8(bytes.slice(position,space));
            if(!/^[1-9][0-9]*$/.test(lengthText)) error('invalid PAX record length');
            var length=Number(lengthText), end=position+length;
            if(!Number.isSafeInteger(length) || end>bytes.length || end<=space+2 || bytes[end-1]!==10) error('invalid PAX record boundary');
            var record=utf8(bytes.slice(space+1,end-1)), equal=record.indexOf('=');
            if(equal<=0) error('invalid PAX attribute');
            var key=record.slice(0,equal); if(own(result,key)) error('duplicate PAX attribute');
            result[key]=record.slice(equal+1); position=end;
        }
        return result;
    }
    function exportSource(source,id,destination,archivePath) {
        var names=Object.create(null), aliases=Object.create(null), folders=Object.create(null);
        A.git(source,['ls-tree','-r','-z',id.commit]).split('\0').forEach(function(entry){
            if(!entry) return; var tab=entry.indexOf('\t'); if(tab<0) error('invalid Git tree response');
            var name=entry.slice(tab+1); if(!runtime(name,false)) return; safe(name);
            var header=entry.slice(0,tab).split(' ');
            if(header.length!==3 || header[1]!=='blob' || ['100644','100755'].indexOf(header[0])<0)
                error('runtime symlink or submodule is not allowed: '+name);
            var alias=folded(name); if(own(aliases,alias)) error('case or Unicode colliding Git paths');
            names[name]=true; aliases[alias]=true;
            var parts=name.split('/'); for(var i=1;i<parts.length;i++) folders[parts.slice(0,i).join('/')]=true;
        });
        ['AllTheThings.toc','AllTheThings.lua','Bindings.xml'].forEach(function(name){if(!own(names,name)) error('commit is missing required ATT runtime file: '+name);});
        keys(folders).forEach(function(name){var alias=folded(name); if(own(aliases,alias)) error('file/directory alias in Git runtime'); aliases[alias]=true;});
        if(A.exists(archivePath)) error('archive scratch path already exists');
        A.git(source,['--literal-pathspecs','archive','--format=tar','--output='+archivePath,id.commit,'--'].concat(keys(names)));
        var data=A.readBytes(archivePath,MAX_SOURCE), total=Number(data.length), pos=0;
        var exported=Object.create(null), pending=null, ended=false;
        if(total%512!==0) error('truncated Git archive');
        while(pos+512<=total) {
            var h=A.bytes(portion(data,pos,512)); pos+=512;
            if(h.every(function(b){return b===0;})) {
                if(pos+512>total) error('TAR lacks its terminal blocks');
                var trailer=A.bytes(portion(data,pos,total-pos));
                if(!trailer.every(function(b){return b===0;})) error('data after TAR terminal block');
                ended=true; break;
            }
            var sum=0; h.forEach(function(b,i){sum+=i>=148&&i<156?32:b;});
            if(sum!==octal(h,148,8)) error('invalid Git archive checksum');
            if(field(h,257,6)!=='ustar') error('unsupported Git archive format');
            var size=octal(h,124,12), type=h[156]===0?'0':String.fromCharCode(h[156]);
            if(size>MAX_FILE || pos+size>total || pos+Math.ceil(size/512)*512>total) error('oversized or truncated Git archive entry');
            var content=portion(data,pos,size); pos+=Math.ceil(size/512)*512;
            if(type==='g' || type==='x') {
                var attrs=pax(content);
                keys(attrs).forEach(function(k){
                    if(type==='g' ? ['comment','mtime'].indexOf(k)<0 : ['path','mtime','atime','ctime'].indexOf(k)<0)
                        error('unsupported TAR extended attribute: '+k);
                });
                if(type==='g') { if(own(attrs,'comment') && attrs.comment!==id.commit) error('Git archive commit metadata mismatch'); }
                else { if(pending!==null) error('multiple pending TAR extended attributes'); pending=attrs; }
                continue;
            }
            var prefix=field(h,345,155), name=(prefix?prefix+'/':'')+field(h,0,100);
            if(pending!==null) { if(own(pending,'path')) name=pending.path; pending=null; }
            if(type==='5') {
                name=safe(name.replace(/\/$/,'')); if(size!==0 || !own(folders,name)) error('unexpected archive directory: '+name);
                continue;
            }
            name=safe(name);
            if(type!=='0' || !own(names,name) || own(exported,name)) error('unexpected archive file or link: '+name);
            var path=A.join(destination,name); A.mkdir(A.join(destination,name.split('/').slice(0,-1).join('/')));
            A.writeBytes(path,content,true); exported[name]=true;
            var prefixBytes=A.bytes(portion(content,0,Math.min(size,64)));
            if(String.fromCharCode.apply(null,prefixBytes).indexOf('version https://git-lfs.github.com/spec/v1')===0)
                error('runtime Git object is an unresolved LFS pointer: '+name);
        }
        if(!ended || pending!==null || !sameKeys(names,exported)) error('Git archive omitted required runtime files');
        if(!sameKeys(names,inventory(destination))) error('Git export contains an unexpected payload');
    }
    function copyProduct(artifact,id,destination) {
        if(A.canonical(A.identity(artifact.identity))!==A.canonical(id)) error('artifact identity mismatch');
        var files=inventory(artifact.extractedDb), expected=artifact.manifest;
        if(!object(expected) || !sameKeys(files,expected)) error('artifact files no longer match their verified manifest');
        keys(files).forEach(function(name){
            safe(name); var hash=expected[name];
            if(typeof hash!=='string' || !/^[0-9a-f]{64}$/.test(hash) || A.hashFile(files[name])!==hash)
                error('artifact changed after verification: '+name);
        });
        var root=game(id), product=artifact.productFiles, selected=Object.create(null);
        if(artifact.productRoot!==root || !Array.isArray(product) || !product.length) error('product root and complete file list must be explicit');
        product.forEach(function(name){
            safe(name);
            if(own(selected,name) || !own(files,name) || keys(ROOTS).map(function(k){return ROOTS[k];}).indexOf(name.split('/')[0])<0)
                error('invalid or duplicate DB product file: '+name);
            selected[name]=true;
            var target=A.join(destination,'db',name); A.mkdir(A.join(destination,'db',name.split('/').slice(0,-1).join('/')));
            A.writeBytes(target,A.readBytes(files[name],MAX_FILE),true);
            if(A.hashFile(target)!==expected[name]) error('artifact changed while copying: '+name);
        });
        return root;
    }
    function reference(from,raw,root) {
        raw=raw.replace(/\\/g,'/').split('[Game]').join(root);
        if(!raw || raw[0]==='/' || /[:\[\]\x00-\x1f\x7f]/.test(raw)) error('unsupported or unsafe runtime reference: '+raw);
        var parts=from?from.split('/').slice(0,-1):[];
        raw.split('/').forEach(function(p){
            if(!p || p==='.') return;
            if(p==='..') { if(!parts.length) error('runtime reference escapes AddOn root'); parts.pop(); }
            else parts.push(p);
        });
        var name=safe(parts.join('/')); if(!runtime(name,true)) error('reference outside runtime allowlist: '+name); return name;
    }
    function closure(root,files) {
        var visiting=Object.create(null), visited=Object.create(null);
        function visit(name) {
            if(!own(files,name)) error('missing runtime reference: '+name);
            if(own(visiting,name)) error('cyclic XML include: '+name);
            if(own(visited,name) || !/\.xml$/i.test(name)) return;
            visited[name]=true; visiting[name]=true;
            var text=A.readText(files[name],MAX_FILE);
            if(/\x00|<!DOCTYPE|<!ENTITY/i.test(text)) error('external XML declarations are not allowed');
            var xmlError=Ref(), document=$.NSXMLDocument.alloc.initWithXMLStringOptionsError($(text),0,xmlError);
            if(!document || !document.rootElement || ObjC.unwrap(document.rootElement.name)===undefined) error('invalid runtime XML: '+name);
            var nodes=document.nodesForXPathError('//*',xmlError);
            if(!nodes) error('invalid runtime XML: '+name);
            var elementCount=Number(nodes.count);
            if(elementCount>100000) error('too many runtime XML elements');
            if(name.indexOf('db/')===0 && /\/Database\.xml$/.test(name)) {
                var children=document.rootElement.children, first=null;
                for(var c=0;c<Number(children.count);c++){var child=children.objectAtIndex(c); if(Number(child.kind)===Number($.NSXMLElementKind)){first=child;break;}}
                var firstFile=first?first.attributeForName('file'):null;
                var value=firstFile?ObjC.unwrap(firstFile.stringValue):'';
                if(!first || ObjC.unwrap(first.localName)!=='Script' || typeof value!=='string' ||
                    reference(name,value,root)!==name.slice(0,name.lastIndexOf('/'))+'/LocalizationDB.lua')
                    error('Database.xml must load LocalizationDB first: '+name);
            }
            for(var i=0;i<elementCount;i++) {
                var node=nodes.objectAtIndex(i), tag=ObjC.unwrap(node.localName); if(tag!=='Script' && tag!=='Include') continue;
                var attribute=node.attributeForName('file'), raw=attribute?ObjC.unwrap(attribute.stringValue):undefined;
                if(typeof raw==='string') visit(reference(name,raw,root));
                else if(tag==='Include') error('XML Include is missing its file');
            }
            delete visiting[name];
        }
        var tocs=keys(files).filter(function(name){return name.indexOf('/')<0 && /\.toc$/i.test(name);});
        if(tocs.indexOf('AllTheThings.toc')<0 || !own(files,'Bindings.xml')) error('snapshot lacks root TOC or Bindings.xml');
        tocs.forEach(function(name){lines(tocText(files[name])).forEach(function(line){line=line.trim();if(line && line[0]!=='#') visit(reference('',line,root));});});
        visit('Bindings.xml'); visit('db/'+root+'/ReferenceDB.lua'); visit('db/'+root+'/Database.xml');
    }
    function metadata(id) { return {'X-ATTSourceSHA':id.commit,'X-ATTObjectFormat':id.object_format,'X-ATTFlavor':id.flavor,'X-ATTProfile':id.profile,'X-ATTRecipe':id.recipe}; }
    function addMetadata(root,id) {
        var path=A.join(root,'AllTheThings.toc'), original=A.readBytes(path,MAX_FILE), text=tocText(path), values=metadata(id);
        var newline=text.indexOf('\r\n')>=0?'\r\n':'\n';
        lines(text).forEach(function(line){
            var match=/^\s*##\s*([^:]+):/.exec(line); if(match && own(values,match[1].trim())) error('source already contains managed identity metadata');
        });
        var tail='', last=Number(original.length)?A.bytes(portion(original,Number(original.length)-1,1))[0]:10;
        if(last!==10 && last!==13) tail+=newline;
        keys(values).forEach(function(key){tail+='## '+key+': '+values[key]+newline;});
        var combined=$.NSMutableData.alloc.init; combined.appendData(original); combined.appendData($(tail).dataUsingEncoding($.NSUTF8StringEncoding));
        A.writeBytes(path,combined,false);
    }
    function checkMetadata(root,id) {
        var expected=metadata(id), found=Object.create(null);
        lines(tocText(A.join(root,'AllTheThings.toc'))).forEach(function(line){
            var match=/^\s*##\s*([^:]+):\s*(.*?)\s*$/.exec(line);
            if(match && own(expected,match[1].trim())) {var key=match[1].trim();if(own(found,key)) error('duplicate managed TOC identity');found[key]=match[2];}
        });
        if(!sameKeys(expected,found) || keys(expected).some(function(k){return expected[k]!==found[k];})) error('TOC identity does not match snapshot identity');
    }
    function snapshotId(id,entries) { return A.hashBytes(A.canonical({identity:id,files:entries})); }
    function verify(addonRoot) {
        var files=inventory(addonRoot); if(!own(files,MANIFEST)) error('snapshot manifest is absent or invalid');
        var manifest=A.readJSON(files[MANIFEST],4*1024*1024); delete files[MANIFEST];
        if(!exact(manifest,['schema_version','identity','product_root','files','snapshot_id']) || manifest.schema_version!==1) error('invalid snapshot schema or fields');
        var id=A.identity(manifest.identity), root=game(id), expected=manifest.files;
        if(manifest.product_root!==root || !object(expected) || !sameKeys(files,expected)) error('snapshot flavor mismatch or missing/extra files');
        keys(expected).forEach(function(name){
            safe(name); var info=expected[name];
            if(!runtime(name,true) || !exact(info,['sha256','size']) || typeof info.sha256!=='string' || !/^[0-9a-f]{64}$/.test(info.sha256) ||
                !Number.isSafeInteger(info.size) || info.size<0 || A.size(files[name])!==info.size || A.hashFile(files[name])!==info.sha256)
                error('snapshot file changed or invalid: '+name);
        });
        if(manifest.snapshot_id!==snapshotId(id,expected)) error('snapshot identity/hash mismatch');
        closure(root,files); checkMetadata(addonRoot,id); return manifest;
    }
    function build(source,identity,artifact,stage) {
        var id=A.identity(identity); game(id);
        if(A.canonical(A.identity(artifact.identity))!==A.canonical(id)) error('exact artifact identity is required');
        var resolved=A.git(source,['rev-parse','--verify',id.commit+'^{commit}']).trim();
        if(resolved!==id.commit || A.git(source,['rev-parse','--show-object-format']).trim()!==id.object_format) error('source commit does not match artifact identity');
        clean(source); A.noLinks(stage);
        if(A.overlap(source,stage) || A.overlap(artifact.extractedDb,stage)) error('stage must be outside source and artifact roots');
        if(A.exists(stage) && !A.regular(stage,true)) error('staging directory must be a real directory');
        if(A.exists(stage) && A.walk(stage).some(function(e){return e.relative!=='stage.json' || !A.regular(e.path,false);})) error('staging directory must be empty except for its store marker');
        A.mkdir(stage); var root=A.join(stage,'AllTheThings'), scratch=A.join(stage,'.archive-'+A.uuid()+'.tar');
        A.mkdir(root);
        try {
            exportSource(source,id,root,scratch); var productRoot=copyProduct(artifact,id,root); addMetadata(root,id);
            var files=inventory(root); closure(productRoot,files); var entries=Object.create(null);
            keys(files).forEach(function(name){entries[name]=fileInfo(files[name]);});
            var manifest={schema_version:1,identity:id,product_root:productRoot,files:entries,snapshot_id:snapshotId(id,entries)};
            A.mkdir(A.join(root,'.att-managed')); A.exclusiveJSON(A.join(root,MANIFEST),manifest);
            clean(source); return {addonRoot:root,manifest:verify(root)};
        } catch(e) { if(A.regular(root,true) && !A.isLink(root)) A.remove(root); throw e; }
        finally { if(A.regular(scratch,false) && !A.isLink(scratch)) A.remove(scratch); }
    }
    A.ensureSourceClean=clean; A.buildSnapshot=build; A.verifySnapshot=verify; A.snapshotManifestPath=MANIFEST;
})(ATT);
