/* macOS managed generations and command orchestration; loaded by att-core.js. */
(function (A) {
    'use strict';
    var J = A.join, eq = function (a,b) { return A.canonical(a) === A.canonical(b); };
    function parent(p) { return p.slice(0,p.lastIndexOf('/')) || '/'; }
    function leaf(p) { return p.slice(p.lastIndexOf('/')+1); }
    function need(ok, message) { if (!ok) A.fail(message); }
    function metadata(p) { need(A.regular(p), 'Managed metadata must be a regular file: '+p); return A.readJSON(p); }
    function children(p) {
        A.noLinks(p); need(A.regular(p,true),'Expected managed directory');
        return ObjC.deepUnwrap($.NSFileManager.defaultManager.contentsOfDirectoryAtPathError(p,Ref())).sort().map(function(n){var path=J(p,n);return {path:path,relative:n,type:A.regular(path,true)?'directory':A.regular(path)?'file':A.isLink(path)?'link':'special'};});
    }
    function rename(a,b,replace) { A.rename(a,b,!!replace); A.fsync(parent(a)); if (parent(a)!==parent(b)) A.fsync(parent(b)); }
    function absentOrRegular(p) { need(!A.exists(p)||A.regular(p), 'Managed file was redirected: '+p); }
    function under(base,p) { return p.indexOf(base+'/')===0; }
    function within(base,p) { base=A.real(base).normalize('NFC').toLowerCase().replace(/\/$/,'');p=A.real(p).normalize('NFC').toLowerCase().replace(/\/$/,'');return p===base||p.indexOf(base+'/')===0; }
    function entryPath(p) { p=A.location(p);return J(A.real(parent(p)),leaf(p)); }
    function entryOverlap(a,b) {
        a=entryPath(a).normalize('NFC').toLowerCase().replace(/\/$/,'');b=entryPath(b).normalize('NFC').toLowerCase().replace(/\/$/,'');
        return a===b||a.indexOf(b+'/')===0||b.indexOf(a+'/')===0;
    }
    function relative(root,p) { need(under(root,p),'Path outside managed store'); return p.slice(root.length+1); }
    function Store(source,root,target,options) {
        this.source=A.real(source); this.root=A.location(root); this.target=A.location(target);
        need(A.regular(this.source,true),'Source is missing');
        need(!entryOverlap(this.source,this.root)&&!entryOverlap(this.source,this.target)&&!entryOverlap(this.root,this.target),'Source, store and target must be separate locations');
        A.noLinks(this.root); A.noLinks(parent(this.target));
        this.options=options||{}; this.owner=null;
        this.generations=J(this.root,'generations'); this.staging=J(this.root,'staging'); this.abandoned=J(this.root,'abandoned');
        this.ownerPath=J(this.root,'owner.json'); this.statePath=J(this.root,'state.json'); this.journalPath=J(this.root,'journal.json');
    }
    Store.prototype.checkOwner=function(o) {
        need(o.schema_version===1&&/^[0-9a-f]{32}$/.test(o.store_id)&&o.source_root===this.source&&o.store_root===this.root&&o.target===this.target,'Store ownership or configured paths do not match'); return o;
    };
    Store.prototype.initialize=function() {
        A.noLinks(this.root); A.mkdir(this.root);
        if (!A.exists(this.ownerPath)) {
            need(children(this.root).length===0,'Refusing to adopt a nonempty unmanaged store');
            var owner={schema_version:1,store_id:A.uuid(),source_root:this.source,store_root:this.root,target:this.target};
            this.checkpoint('before_owner_publish');
            try { A.exclusiveJSON(this.ownerPath,owner); } catch(e) { if (!A.regular(this.ownerPath)) throw e; }
            this.checkpoint('after_owner_publish');
        }
        this.owner=this.checkOwner(metadata(this.ownerPath));
        [this.generations,this.staging,this.abandoned].forEach(function(p) { A.noLinks(p); A.mkdir(p); });
        var lock=J(this.root,'store.lock'); absentOrRegular(lock);
        if (!A.exists(lock)) { try { A.writeBytes(lock,'',true); A.fsync(lock); A.fsync(this.root); } catch(e) { if (!A.regular(lock)) throw e; } }
        this.validateOwner(); return this.owner;
    };
    Store.prototype.validateOwner=function() {
        A.noLinks(this.root); need(A.regular(this.root,true)&&A.real(this.root)===this.root,'Store is missing or redirected');
        this.owner=this.checkOwner(metadata(this.ownerPath));
        [this.generations,this.staging,this.abandoned].forEach(function(p) { A.noLinks(p); need(A.regular(p,true),'Managed directory missing'); });
        A.noLinks(parent(this.target)); need(A.regular(J(this.root,'store.lock')),'Store lock must be regular'); return this.owner;
    };
    Store.prototype.checkpoint=function(name) { if (this.options.fault) this.options.fault(name); };
    Store.prototype.verify=function(p) {
        A.noLinks(p); need(A.regular(p,true),'Snapshot must be a real directory');
        var m=(this.options.verify||A.verifySnapshot)(p); A.identity(m.identity);
        need(m.schema_version===1&&/^[0-9a-f]{64}$/.test(m.snapshot_id)&&m.snapshot_id===A.hashBytes(A.canonical({identity:m.identity,files:m.files})),'Snapshot identity is inconsistent'); return m;
    };
    Store.prototype.verifyGeneration=function(p) {
        need(leaf(p)==='AllTheThings'&&parent(parent(p))===this.generations&&/^[0-9a-f]{64}$/.test(leaf(parent(p))),'Pointer is outside managed generations');
        A.noLinks(p); var r=metadata(J(parent(p),'generation.json')),m=this.verify(p);
        need(r.store_id===this.owner.store_id&&r.snapshot_id===leaf(parent(p))&&m.snapshot_id===r.snapshot_id&&eq(r.identity,m.identity),'Generation identity or ownership changed'); return m;
    };
    Store.prototype.active=function() {
        if (!A.exists(this.target)&&!A.isLink(this.target)) return {payload:null,manifest:null};
        need(A.isLink(this.target),'Existing target is a real directory or file; it will be preserved');
        var raw=A.readLink(this.target); need(raw&&raw.charAt(0)==='/', 'Deployment pointer must use an absolute path');
        return {payload:raw,manifest:this.verifyGeneration(raw)};
    };
    Store.prototype.state=function(active,staged) {
        return {schema_version:1,store_id:this.owner.store_id,active:active.payload?relative(this.root,active.payload):null,active_identity:active.manifest?active.manifest.identity:null,active_snapshot_id:active.manifest?active.manifest.snapshot_id:null,staged:staged?relative(this.root,staged):null};
    };
    Store.prototype.desired=function(id,m,check) { A.identity(id); need(eq(id,m.identity),'Candidate identity does not match desired source'); need(typeof check==='function'&&check(),'Desired source changed; deployment cancelled'); };
    Store.prototype.newStage=function() { this.validateOwner(); var p=J(this.staging,A.uuid()); A.mkdir(p); A.exclusiveJSON(J(p,'stage.json'),{store_id:this.owner.store_id}); A.fsync(this.staging); return p; };
    Store.prototype.publish=function(stage,id,check) {
        this.validateOwner(); stage=A.location(stage); if (leaf(stage)==='AllTheThings') stage=parent(stage);
        need(parent(stage)===this.staging&&/^[0-9a-f]{32}$/.test(leaf(stage)),'Stage is outside owned staging'); A.noLinks(stage);
        need(metadata(J(stage,'stage.json')).store_id===this.owner.store_id,'Stage ownership changed');
        need(eq(children(stage).map(function(x){return x.relative;}).sort(),['AllTheThings','stage.json']),'Unexpected stage files');
        var payload=J(stage,'AllTheThings'),m=this.verify(payload),dest=J(this.generations,m.snapshot_id); this.desired(id,m,check);
        if (A.exists(dest)) { need(eq(this.verifyGeneration(J(dest,'AllTheThings')),m),'Existing generation differs'); rename(stage,J(this.abandoned,leaf(stage)),false); }
        else {
            A.exclusiveJSON(J(stage,'generation.json'),{store_id:this.owner.store_id,snapshot_id:m.snapshot_id,identity:m.identity});
            A.walk(payload).filter(function(x){return x.type==='file';}).forEach(function(x){A.fsync(x.path);});
            A.walk(payload).filter(function(x){return x.type==='directory';}).sort(function(a,b){return b.path.length-a.path.length;}).forEach(function(x){A.fsync(x.path);});
            A.fsync(payload); A.fsync(stage); this.checkpoint('before_publish_rename');
            need(eq(this.verify(payload),m),'Candidate changed before publication'); this.desired(id,m,check); rename(stage,dest,false); this.checkpoint('after_publish_rename');
        }
        var candidate=J(dest,'AllTheThings'); A.atomicJSON(this.statePath,this.state(this.active(),candidate)); return candidate;
    };
    function classifyProcessScan(code,output) {
        if(code!==0||typeof output!=='string'||!output.trim()) return {state:'unknown'};
        var running=output.split('\n').some(function(line){var n=leaf(line.trim()).toLowerCase().replace(/[^a-z0-9]/g,'');return n.indexOf('warcraft')>=0||/^wow/.test(n);});
        return {state:running?'running':'closed'};
    }
    function processProbe() {
        try { var r=A.exec(['/bin/ps','-A','-o','comm='],null,{timeoutMilliseconds:10000,maxOutput:8*1024*1024}); return classifyProcessScan(r.code,r.stdout);
        } catch(e) { return {state:'unknown'}; }
    }
    Store.prototype.activate=function(candidate,id,check,clientClosed,probe) {
        this.validateOwner(); need(clientClosed===true,'Activation requires --client-closed and client remaining closed');
        probe=probe||this.options.probe||processProbe; need(probe().state==='closed','Client is running or unknown; activation refused');
        candidate=A.location(candidate); var m=this.verifyGeneration(candidate); this.desired(id,m,check); var previous=this.active();
        if (previous.payload===candidate) return this.state(previous,null);
        A.mkdir(parent(this.target)); A.noLinks(parent(this.target));
        var temp=J(parent(this.target),'.att-activate-'+this.owner.store_id+'-'+A.uuid());
        A.atomicJSON(this.journalPath,{schema_version:1,store_id:this.owner.store_id,candidate:relative(this.root,candidate),previous:previous.payload?relative(this.root,previous.payload):null,temporary_link:temp,target:this.target});
        this.checkpoint('after_activation_journal'); A.symlink(temp,candidate); A.fsync(parent(this.target)); this.checkpoint('before_pointer_replace');
        m=this.verifyGeneration(candidate); this.desired(id,m,check); need(eq(this.active(),previous),'Active deployment changed during activation');
        need(probe().state==='closed','Client is running or unknown; activation refused'); this.desired(id,m,check);
        A.renameLink(temp,this.target,previous.payload); A.fsync(parent(this.target)); this.checkpoint('after_pointer_replace');
        var state=this.state({payload:candidate,manifest:m},null); A.atomicJSON(this.statePath,state); this.checkpoint('after_activation_state');
        A.remove(this.journalPath); A.fsync(this.root); return state;
    };
    Store.prototype.recover=function() {
        this.validateOwner(); var active=this.active(),state=this.state(active,null);
        if (A.exists(this.statePath)) { var old=metadata(this.statePath); need(old.schema_version===1&&old.store_id===this.owner.store_id,'Foreign state metadata');
            if (typeof old.staged==='string'&&/^generations\/[0-9a-f]{64}\/AllTheThings$/.test(old.staged)) { this.verifyGeneration(J(this.root,old.staged)); state.staged=old.staged; }
        }
        if (state.staged===state.active) state.staged=null;
        if (A.exists(this.journalPath)) {
            var j=metadata(this.journalPath); need(j.schema_version===1&&j.store_id===this.owner.store_id&&j.target===this.target,'Foreign activation journal');
            need(typeof j.candidate==='string'&&/^generations\/[0-9a-f]{64}\/AllTheThings$/.test(j.candidate),'Invalid journal candidate');
            var c=J(this.root,j.candidate); this.verifyGeneration(c); var actual=active.payload?relative(this.root,active.payload):null;
            need(actual===j.previous||actual===j.candidate,'Actual pointer differs from journal');
            var t=j.temporary_link; need(typeof t==='string'&&parent(t)===parent(this.target)&&leaf(t).indexOf('.att-activate-'+this.owner.store_id+'-')===0&&/^[0-9a-f]{32}$/.test(leaf(t).slice(('.att-activate-'+this.owner.store_id+'-').length)),'Invalid temporary journal link');
            if (A.exists(t)||A.isLink(t)) { need(A.isLink(t)&&A.readLink(t)===c,'Foreign temporary pointer; preserved'); A.remove(t); A.fsync(parent(this.target)); }
            A.atomicJSON(this.statePath,state); A.remove(this.journalPath); A.fsync(this.root);
        }
        var self=this; children(this.staging).forEach(function(x){ need(x.type==='directory'&&/^[0-9a-f]{32}$/.test(x.relative),'Unknown staging entry; preserved'); A.noLinks(x.path); need(metadata(J(x.path,'stage.json')).store_id===self.owner.store_id,'Foreign stage; preserved'); rename(x.path,J(self.abandoned,x.relative),false); });
        A.atomicJSON(this.statePath,state); return state;
    };
    A.Store=Store; A.probeWowProcesses=processProbe; A.classifyProcessScan=classifyProcessScan;
    var bundleFiles=['att-artifact.js','att-core.js','att-deploy.sh','att-snapshot.js','att-store.js'];
    var hookNames=['post-checkout','post-merge','post-rewrite','post-commit'];
    function quote(s) { return "'"+String(s).replace(/'/g,"'\\''")+"'"; }
    function sourceRoot(p) { p=A.real(p); need(A.real(A.git(p,['rev-parse','--show-toplevel']).trim())===p,'--source must be repository root'); return p; }
    function gitPath(source,name) { var p=A.git(source,['rev-parse','--git-path',name]).trim(); return A.location(p.charAt(0)==='/'?p:J(source,p)); }
    function defaultConfig(source) { return gitPath(source,'att-script-deploy.json'); }
    function current(c) { return A.identity({commit:A.git(c.source,['rev-parse','HEAD']).trim(),object_format:A.git(c.source,['rev-parse','--show-object-format']).trim(),flavor:c.flavor,profile:c.profile,recipe:c.recipe}); }
    function managed(c,rel,directory) { A.safeRelative(rel); var p=J(c.store,rel); A.noLinks(p); if (directory) A.mkdir(p); else A.mkdir(parent(p)); return p; }
    function verifyBundle(c) {
        need(c.bundle===J(c.store,'runtime',c.bundle_sha256)&&/^[0-9a-f]{64}$/.test(c.bundle_sha256),'Invalid installed script bundle path'); A.noLinks(c.bundle);
        need(A.regular(c.bundle,true),'Missing installed script bundle'); var inv=J(c.bundle,'inventory.txt'); need(A.regular(inv)&&A.hashFile(inv)===c.bundle_sha256,'Script inventory was modified');
        var names=[],lines=A.readText(inv,65536).split('\n'); lines.forEach(function(line){if(!line)return; var m=/^([0-9a-f]{64})  ([a-z][a-z0-9-]*\.(?:js|sh))$/.exec(line); need(m,'Invalid script inventory'); need(names.indexOf(m[2])<0,'Duplicate inventory item'); names.push(m[2]); var f=J(c.bundle,m[2]); A.noLinks(f); need(A.regular(f)&&A.hashFile(f)===m[1],'Installed script changed: '+m[2]); });
        need(eq(names.sort(),bundleFiles.slice().sort()),'Incomplete script inventory'); need(eq(children(c.bundle).map(function(x){return x.relative;}).sort(),bundleFiles.concat(['inventory.txt']).sort()),'Unexpected installed script files');
    }
    function validateConfig(c,installed) {
        need(c.schema===1,'Unsupported script deployment configuration'); ['source','store','target','flavor','profile','recipe'].forEach(function(k){need(typeof c[k]==='string'&&c[k],'Missing configuration field: '+k);});
        need(sourceRoot(c.source)===c.source&&A.location(c.store)===c.store&&A.location(c.target)===c.target,'Configuration paths must be canonical'); new Store(c.source,c.store,c.target); current(c);
        if(c.allow_local_audit) need(typeof c.audited_contract==='string'&&/^[0-9a-f]{64}$/.test(c.audited_contract_sha256||''),'Historical audit requires an explicit hash-pinned contract');
        if(installed!==false) verifyBundle(c); return c;
    }
    function installBundle(store) {
        var hashes={},inventory=''; bundleFiles.forEach(function(n){var p=J(A.base,n); A.noLinks(p); need(A.regular(p),'Source script missing: '+n); hashes[n]=A.hashFile(p); inventory+=hashes[n]+'  '+n+'\n';});
        var hash=A.hashBytes(inventory),runtime=J(store,'runtime'),dest=J(runtime,hash); A.noLinks(runtime); A.mkdir(runtime);
        if(!A.exists(dest)) {
            var stage=J(runtime,'.tool-'+A.uuid()); A.mkdir(stage);
            bundleFiles.forEach(function(n){A.writeBytes(J(stage,n),A.readBytes(J(A.base,n),4*1024*1024),true); need(A.hashFile(J(stage,n))===hashes[n],'Source script changed during installation'); A.fsync(J(stage,n));});
            A.writeBytes(J(stage,'inventory.txt'),inventory,true); A.fsync(J(stage,'inventory.txt')); A.fsync(stage); rename(stage,dest,false);
            need(A.exec(['/bin/chmod','700',J(dest,'att-deploy.sh')]).code===0,'Cannot make installed entry executable');
        }
        return {path:dest,sha256:hash};
    }
    function bootstrap(c,config,args) {
        var internal=args[0]==='__locked',invoke=['--config',config].concat(args),launch;
        if(internal) {
            var js="ObjC.import('Foundation'); (0,eval)(ObjC.unwrap($.NSString.stringWithContentsOfFileEncodingError("+JSON.stringify(J(c.bundle,'att-core.js'))+",$.NSUTF8StringEncoding,Ref()))); ATT.base="+JSON.stringify(c.bundle)+"; ['att-artifact.js','att-snapshot.js','att-store.js'].forEach(function(n){ATT.load(ATT.base+'/'+n);}); run=function(){return ATT.canonical(ATT.lockedOperation("+args.slice(1).map(JSON.stringify).join(',')+"));};";
            launch='exec /usr/bin/osascript -l JavaScript -e '+quote(js)+'\n';
        } else launch='exec /usr/bin/osascript -l JavaScript "$bundle/att-core.js" '+invoke.map(quote).join(' ')+'\n';
        return 'bundle='+quote(c.bundle)+'\nexpected='+quote(c.bundle_sha256)+'\n'+
            'PATH=/usr/bin:/bin:/usr/sbin:/sbin\nexport PATH\ncheck=$bundle\nwhile [ "$check" != / ]; do [ ! -L "$check" ] || exit 1; check=$(/usr/bin/dirname -- "$check") || exit 1; done\n'+
            '[ -d "$bundle" ] && [ -f "$bundle/inventory.txt" ] && [ ! -L "$bundle/inventory.txt" ] || exit 1\n'+
            'actual=$(/usr/bin/shasum -a 256 -- "$bundle/inventory.txt") || exit 1\nactual=${actual%% *}\n[ "$actual" = "$expected" ] || { echo "ATT script inventory changed; refusing execution." >&2; exit 1; }\n'+
            'wanted='+quote(bundleFiles.concat(['inventory.txt']).sort().join('\n'))+'\n[ "$(/bin/ls -A -- "$bundle")" = "$wanted" ] || exit 1\n'+
            'while IFS=" " read -r digest name; do\n  [ -n "$digest" ] || continue\n  case "$name" in att-artifact.js|att-core.js|att-deploy.sh|att-snapshot.js|att-store.js) ;; *) exit 1 ;; esac\n  [ -f "$bundle/$name" ] && [ ! -L "$bundle/$name" ] || exit 1\n  actual=$(/usr/bin/shasum -a 256 -- "$bundle/$name") || exit 1\n  actual=${actual%% *}\n  [ "$actual" = "$digest" ] || { echo "Installed ATT script changed; refusing execution." >&2; exit 1; }\ndone < "$bundle/inventory.txt"\n'+
            launch;
    }
    function gitResult(source,args) { return A.exec(['/usr/bin/git','--no-optional-locks','-c','core.fsmonitor=false','-c','core.untrackedCache=false','-C',source].concat(args)); }
    var bridgeBody='#!/bin/sh\n\n# Git hooks must never make checkout, pull, merge, or rebase fail.\nroot=$(git rev-parse --show-toplevel 2>/dev/null) || exit 0\nconfig=$(git rev-parse --git-path att-script-deploy.json 2>/dev/null) || exit 0\ncase "$config" in /*) ;; *) config="$root/$config" ;; esac\n[ -f "$config" ] || { echo "ATT script deployment: configure and install stable hooks first; skipping." >&2; exit 0; }\necho "ATT script deployment: stable external hooks require install-hooks; skipping." >&2\nexit 0\n';
    function hookPolicy(c) {
        var gitdir=A.real(A.git(c.source,['rev-parse','--absolute-git-dir']).trim()),common=A.git(c.source,['rev-parse','--git-common-dir']).trim(); common=A.real(common.charAt(0)==='/'?common:J(c.source,common));
        need(gitdir===common,'Linked worktrees share Git configuration; use a dedicated clone for hooks');
        var r=gitResult(c.source,['config','--get','core.hooksPath']); need(r.code===0||r.code===1,'Cannot inspect effective hooks'); var previous=r.code===0?r.stdout.trim():null;
        need(previous===null||previous!=='','Empty custom hooks path requires manual integration'); var effective=previous===null?J(gitdir,'hooks'):A.location(previous.charAt(0)==='/'?previous:J(c.source,previous));
        A.noLinks(effective); var expected=J(c.store,'hooks'),known=J(c.source,'.githooks');
        if(effective===expected) {
            var marker=metadata(J(expected,'.installed.json')); need(eq(Object.keys(marker.files).sort(),hookNames.slice().sort()),'Hook receipt changed');
            need(eq(children(expected).map(function(x){return x.relative;}).sort(),hookNames.concat(['.installed.json']).sort()),'Unexpected managed hooks');
            hookNames.forEach(function(n){need(A.regular(J(expected,n))&&A.hashFile(J(expected,n))===marker.files[n],'Managed hooks changed; preserved');}); return previous;
        }
        need(previous===null||effective===J(gitdir,'hooks')||effective===known,'Existing custom hooks require manual integration');
        if(A.exists(effective)) {
            need(A.regular(effective,true),'Hooks path is not a directory'); children(effective).forEach(function(x){
                if(effective!==known&&/\.sample$/.test(x.relative)) return;
                need(effective===known&&A.regular(x.path),'Existing custom hooks require manual integration');
                var n=x.relative,text=A.readText(x.path,65536).replace(/\r\n/g,'\n');
                if(hookNames.indexOf(n)>=0) need(text.trim()==='#!/bin/sh\n\n"$(dirname "$0")/run-db-sync"','Existing hook changed; preserved');
                else if(n==='run-db-sync') { var old=gitResult(c.source,['show','HEAD:.githooks/run-db-sync']); need(text===bridgeBody||(old.code===0&&text===old.stdout.replace(/\r\n/g,'\n')),'Existing hook bridge changed; preserved'); }
                else A.fail('Existing custom hooks require manual integration');
            });
        }
        return previous;
    }
    function installHooks(c,config) {
        var previous=hookPolicy(c),dir=managed(c,'hooks',true),body='#!/bin/sh\n# ATT script deployment: stage only; Git always completes.\n(\n'+bootstrap(c,config,['request'])+'\n) || true\nexit 0\n',hashes={};
        hookNames.forEach(function(n){var p=J(dir,n); absentOrRegular(p); A.writeBytes(p,body,false); A.fsync(p); need(A.exec(['/bin/chmod','700',p]).code===0,'Cannot make hook executable'); hashes[n]=A.hashFile(p);});
        A.atomicJSON(J(dir,'.installed.json'),{files:hashes,previous_hooks_path:previous}); A.git(c.source,['config','--local','core.hooksPath',dir]);
    }
    function desired(c) { var id=current(c),d={token:A.uuid(),identity:id}; A.atomicJSON(managed(c,'requests/desired.json'),d); return d; }
    function matches(c,config,d) {
        try { return eq(metadata(managed(c,'requests/desired.json')),d)&&eq(metadata(config),c)&&eq(current(c),d.identity)&&(A.ensureSourceClean(c.source),true); } catch(e) { return false; }
    }
    function writeResult(c,d,result) {
        if(metadata(managed(c,'requests/desired.json')).token===d.token) { result.desired=d; A.atomicJSON(managed(c,'worker-status.json'),result); }
    }
    function cleanupExtraction(c,artifact) {
        if(!artifact||typeof artifact.extractedDb!=='string') return;
        var p=artifact.extractedDb,cache=J(c.store,'artifacts');
        if(parent(p)!==cache||!/^\.att-use-[0-9a-f]{32}$/.test(leaf(p))) return;
        try {
            A.noLinks(p); var rows=A.walk(p),actual=rows.filter(function(x){return x.type==='file';});
            if(rows.some(function(x){return x.type!=='file'&&x.type!=='directory';})||!eq(actual.map(function(x){return x.relative;}).sort(),Object.keys(artifact.manifest).sort())) return;
            if(actual.some(function(x){return A.hashFile(x.path)!==artifact.manifest[x.relative];})) return;
            A.remove(p);A.fsync(cache);
        } catch(ignore) { /* A changed scratch extraction is preserved for inspection. */ }
    }
    function lockedCall(c,config,command,token,offline) {
        verifyBundle(c); var args=['__locked',config,command,token||'',offline?'offline':'online'];
        var r=A.exec(['/bin/sh','-c',bootstrap(c,config,args)],c.store,{timeoutMilliseconds:900000});
        need(r.code===0,'Deployment worker failed: '+(r.stdout||r.stderr).trim()); return A.strictParse(r.stdout.trim());
    }
    function startWorker(c,config,d,offline) {
        var log=managed(c,'worker.log'); absentOrRegular(log); if(!A.exists(log)) A.writeBytes(log,'',true);
        var script='('+bootstrap(c,config,['worker','--token',d.token].concat(offline?['--offline']:[]))+') </dev/null >>'+quote(log)+' 2>&1 &\necho $!\n';
        var r=A.exec(['/bin/sh','-c',script],c.store); need(r.code===0&&/^\d+\s*$/.test(r.stdout),'Cannot start external worker'); return Number(r.stdout.trim());
    }
    function parse(argv) {
        var p={source:ObjC.unwrap($.NSFileManager.defaultManager.currentDirectoryPath),config:null,command:null,options:{}},flags=['offline','client-closed','install-hooks','allow-local-audit'],seen={};
        for(var i=0;i<argv.length;i++) { var a=argv[i]; if(a==='--help'||a==='-h'){p.command='help';return p;}
            if(a.slice(0,2)!=='--'){need(p.command===null,'Unexpected argument: '+a);p.command=a;continue;}
            var k=a.slice(2); need(!seen[k],'Duplicate option: '+a);seen[k]=true; var v=true;
            if(flags.indexOf(k)<0){need(i+1<argv.length&&argv[i+1].slice(0,2)!=='--','Missing option value: '+a);v=argv[++i];}
            if(k==='source')p.source=v; else if(k==='config')p.config=v; else p.options[k]=v;
        }
        var allowed={configure:['store','target','flavor','profile','recipe','install-hooks','offline','allow-local-audit','audited-contract','audited-contract-sha256'],update:['offline'],request:['offline'],worker:['token','offline'],activate:['client-closed'],status:[],recover:[],'install-hooks':[],help:[]};
        need(allowed[p.command],'Expected configure, update, request, status, activate, recover or install-hooks'); Object.keys(p.options).forEach(function(k){need(allowed[p.command].indexOf(k)>=0,'Unsupported option --'+k);}); return p;
    }
    function lockedExecute(config,command,token,offline) {
        var c=validateConfig(metadata(config)),store=new Store(c.source,c.store,c.target); store.validateOwner(); var recovered=store.recover();
        if(command==='reconfigure') {
            var changed=A.strictParse(token); validateConfig(changed,false);
            ['source','store','target','flavor','profile','recipe'].forEach(function(k){need(changed[k]===c[k],'Reconfiguration cannot change owned paths or identity settings');});
            changed.bundle=c.bundle;changed.bundle_sha256=c.bundle_sha256;verifyBundle(changed);
            need(eq(metadata(config),c),'Configuration changed concurrently; preserved');A.atomicJSON(config,changed);
            return {status:'configured',config:config,bundle:changed.bundle,message:'Owned configuration audit/offline settings updated; active generation kept'};
        }
        if(command==='install-hooks') { installHooks(c,config); return {status:'configured',message:'Stable stage-only hooks installed'}; }
        if(command==='recover') return {status:'recovered',deployment:recovered};
        if(command==='status') return {status:'status',source_commit:current(c).commit,deployment:recovered,preparation:A.exists(managed(c,'worker-status.json'))?metadata(managed(c,'worker-status.json')):null};
        var d=metadata(managed(c,'requests/desired.json'));
        if(command==='worker') {
            if(d.token!==token)return {status:'superseded',message:'Newer source request replaced this worker'};
            try {
                need(matches(c,config,d),'Source changed or modified; previous deployment kept');
                var artifact=A.downloadArtifact(d.identity,managed(c,'artifacts',true),{offline:offline||c.offline===true,allowLocalAudit:c.allow_local_audit===true,auditPath:c.audited_contract,auditSha256:c.audited_contract_sha256});
                need(matches(c,config,d),'Newer source request superseded download'); var stage=store.newStage(),snapshot,candidate;
                try { snapshot=A.buildSnapshot(c.source,d.identity,artifact,stage);candidate=store.publish(stage,d.identity,function(){return matches(c,config,d);}); }
                finally { cleanupExtraction(c,artifact); }
                var result={status:'staged',message:'Verified complete version is prepared; activation requires client remaining closed',candidate:candidate,identity:snapshot.manifest.identity,artifact_provenance:artifact.provenance}; writeResult(c,d,result); return result;
            } catch(e) { var error={status:'error',message:String(e.message||e),previous_deployment_kept:true}; writeResult(c,d,error); throw e; }
        }
        need(command==='activate','Invalid internal locked command'); var prepared=metadata(managed(c,'worker-status.json')); need(prepared.status==='staged','No verified prepared version'); d=prepared.desired;
        need(matches(c,config,d),'Prepared source is stale or modified'); var active=store.activate(prepared.candidate,d.identity,function(){return matches(c,config,d);},token==='client-closed');
        var result={status:'active',message:'Complete verified version activated',deployment:active}; prepared.activation=result; writeResult(c,d,prepared); return result;
    }
    A.cli=function(argv) {
        var p=parse(argv),o=p.options;
        if(p.command==='help')return {status:'help',message:'configure --store PATH --target PATH --flavor VALUE --profile VALUE --recipe VALUE [--install-hooks]; update [--offline]; request; status; activate --client-closed; recover; install-hooks'};
        if(p.command==='configure') {
            var source=sourceRoot(p.source),config=p.config?A.location(p.config):defaultConfig(source),gitdir=A.real(A.git(source,['rev-parse','--absolute-git-dir']).trim()); A.noLinks(config);
            need(!within(source,config)||within(gitdir,config),'Configuration must live outside checkout or in private Git metadata');
            ['store','target','flavor','profile','recipe'].forEach(function(k){need(typeof o[k]==='string','Missing --'+k);});
            var c={schema:1,source:source,store:A.location(o.store),target:A.location(o.target),flavor:o.flavor,profile:o.profile,recipe:o.recipe,offline:o.offline===true};
            need(!entryOverlap(config,c.store)&&!entryOverlap(config,c.target),'Configuration must be separate from the store and addon entry');
            if(o['allow-local-audit']||o['audited-contract']) {c.allow_local_audit=o['allow-local-audit']===true;c.audited_contract=o['audited-contract']?A.real(o['audited-contract']):null;c.audited_contract_sha256=o['audited-contract-sha256']||null;}
            validateConfig(c,false);
            if(A.exists(config)) {
                var prior=validateConfig(metadata(config)); ['source','store','target','flavor','profile','recipe'].forEach(function(k){need(c[k]===prior[k],'Reconfiguration cannot change owned paths or identity settings');});
                new Store(prior.source,prior.store,prior.target).validateOwner();
                if(o['install-hooks']) hookPolicy(prior);
                var changed=lockedCall(prior,config,'reconfigure',A.canonical(c),false);
                if(o['install-hooks']) lockedCall(validateConfig(metadata(config)),config,'install-hooks');
                return changed;
            }
            need(!A.exists(c.target)&&!A.isLink(c.target),'Existing addon entry will not be adopted'); if(o['install-hooks'])hookPolicy(c);
            var st=new Store(c.source,c.store,c.target);st.initialize();var b=installBundle(c.store);c.bundle=b.path;c.bundle_sha256=b.sha256;verifyBundle(c);A.mkdir(parent(config));A.exclusiveJSON(config,c);
            if(o['install-hooks']) lockedCall(c,config,'install-hooks'); return {status:'configured',config:config,bundle:c.bundle,message:'External script staging configured; no game deployment changed'};
        }
        var cfg=p.config?A.location(p.config):defaultConfig(sourceRoot(p.source)),saved=validateConfig(metadata(cfg)); new Store(saved.source,saved.store,saved.target).validateOwner();
        if(p.command==='update'||p.command==='request') { var d=desired(saved),offline=o.offline===true||saved.offline===true;
            if(p.command==='update')return lockedCall(saved,cfg,'worker',d.token,offline);return {status:'requested',commit:d.identity.commit,worker_pid:startWorker(saved,cfg,d,offline)};
        }
        if(p.command==='worker')return lockedCall(saved,cfg,'worker',o.token,o.offline===true||saved.offline===true);
        return lockedCall(saved,cfg,p.command,o['client-closed']?'client-closed':'');
    };
    A.verifyScriptBundle=verifyBundle; A.bootstrapScript=bootstrap; A.installHooks=installHooks; A.parseCli=parse;
    // The transaction and its native flock lease share one JXA process.
    // This typed internal API is never a CLI flag or environment bypass.
    A.lockedOperation=function(config,command,token,mode) {
        var c=validateConfig(metadata(config));new Store(c.source,c.store,c.target).validateOwner();
        return A.withLock(J(c.store,'store.lock'),command==='worker'?180000:15000,function(){return lockedExecute(config,command,token,mode==='offline');});
    };
})(ATT);
