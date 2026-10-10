#!/bin/sh
# Real public-byte acceptance; use an isolated, freshly fetched dedicated clone.
set -eu
usage='test-public-ab.sh SOURCE AUDIT_A AUDIT_B NEW_EVIDENCE_DIR --client-closed'
[ "$#" -eq 5 ] && [ "$5" = --client-closed ] || { echo "$usage" >&2; exit 2; }
scripts=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)
source=$(CDPATH= cd -- "$1" && pwd -P)
audit_a=$2
audit_b=$3
evidence=$4
a=c182fc564f5467ae45e99482dc0267fcd8198fdb
b=4d45a8d74f1d5c5bf50b7489a128ce28432022ea
pin_a=d0558e0273c8527f9eb121ac61687a0fcee8cf7e07991caf664ebdfc5d6765c4
pin_b=fe445cd8e1f6c0bae7daa959bc610c16d2020ff04d32a22052f038eb9887f8c3
[ "$(uname -s)" = Darwin ] || { echo 'This acceptance requires a Mac.' >&2; exit 1; }
[ ! -e "$evidence" ] && [ ! -L "$evidence" ] || { echo 'Evidence directory must be new.' >&2; exit 1; }
[ "$(git -C "$source" rev-parse HEAD)" = "$a" ] || { echo 'Source must start at the full A commit.' >&2; exit 1; }
[ -z "$(git -C "$source" status --porcelain --untracked-files=all)" ] || { echo 'Source must be clean.' >&2; exit 1; }
actual=$(/usr/bin/shasum -a 256 -- "$audit_a"); [ "${actual%% *}" = "$pin_a" ]
actual=$(/usr/bin/shasum -a 256 -- "$audit_b"); [ "${actual%% *}" = "$pin_b" ]
mkdir -p "$evidence/AddOns"
evidence=$(CDPATH= cd -- "$evidence" && pwd -P)
config=$evidence/config.json
store=$evidence/store
target=$evidence/AddOns/AllTheThings
launcher=$scripts/att-deploy.sh
cat > "$evidence/check.js" <<'JXA'
ObjC.import('Foundation');
function run(args) {
    var core=ObjC.unwrap($.NSString.stringWithContentsOfFileEncodingError(args[0]+'/att-core.js',$.NSUTF8StringEncoding,Ref()));
    eval(core);
    ['att-artifact.js','att-snapshot.js','att-store.js'].forEach(function(n){ATT.load(args[0]+'/'+n);});
    var c=ATT.readJSON(args[1]),s=new ATT.Store(c.source,c.store,c.target);s.validateOwner();
    if(args[2]==='worker'){
        var desired=ATT.readJSON(c.store+'/requests/desired.json');
        if(!ATT.exists(c.store+'/worker-status.json'))return 'pending';
        var w=ATT.readJSON(c.store+'/worker-status.json');
        if(ATT.canonical(w.desired)!==ATT.canonical(desired))return 'pending';
        if(w.status==='error'&&!/audit|metadata|identity|contract/i.test(w.message))throw Error('Unexpected worker failure: '+w.message);
        return w.status;
    }
    var active=s.active();
    if(!active.payload||active.manifest.identity.commit!==args[3])throw Error('Complete active generation differs');
    var id=active.manifest.identity;
    if(id.object_format!=='sha1'||id.flavor!=='retail'||id.profile!=='historical-ci-bytes'||id.recipe!=='audited-legacy-parser')throw Error('Active full identity differs');
    if(args[2]==='base'&&ATT.hashFile(active.payload+'/src/base.lua')!==ATT.hashFile(args[4]))throw Error('Active source bytes differ from exact git archive');
    if(args[2]==='candidate'){
        var prepared=ATT.readJSON(c.store+'/worker-status.json');
        var m=s.verifyGeneration(prepared.candidate);
        if(prepared.status!=='staged'||m.identity.commit!==args[4])throw Error('Candidate identity differs');
        if(args[5]&&ATT.hashFile(prepared.candidate+'/src/base.lua')!==ATT.hashFile(args[5]))throw Error('Candidate source bytes differ from exact git archive');
    }
    return ATT.canonical({status:'verified',active_identity:id,snapshot_id:active.manifest.snapshot_id,active:active.payload});
}
JXA
configure() {
    /bin/sh "$launcher" configure --source "$source" --config "$config" --store "$store" --target "$target" --flavor retail --profile historical-ci-bytes --recipe audited-legacy-parser --allow-local-audit --audited-contract "$1" --audited-contract-sha256 "$2"
}
check_active() { /usr/bin/osascript -l JavaScript "$evidence/check.js" "$scripts" "$config" active "$1"; }
wait_worker() {
    wanted=$1
    i=0
    while [ "$i" -lt 180 ]; do
        got=$(/usr/bin/osascript -l JavaScript "$evidence/check.js" "$scripts" "$config" worker)
        [ "$got" != pending ] && { [ "$got" = "$wanted" ] || { cat "$store/worker-status.json" >&2; return 1; }; return 0; }
        i=$((i+1))
        /bin/sleep 1
    done
    echo 'Worker did not complete within acceptance deadline.' >&2
    return 1
}
echo 'Client must remain closed throughout this acceptance. Only the fixture AddOns target is used.'
configure "$audit_a" "$pin_a" > "$evidence/01-configure-A.json"
/bin/sh "$launcher" update --config "$config" > "$evidence/02-stage-A.json"
/bin/sh "$launcher" activate --config "$config" --client-closed > "$evidence/03-activate-A.json"
check_active "$a" > "$evidence/04-verify-A.json"
/bin/sh "$launcher" install-hooks --config "$config" > "$evidence/05-install-hooks.json"
git -C "$source" -c credential.helper= -c credential.interactive=false pull --ff-only origin "$b" > "$evidence/06-ordinary-pull-B.log" 2>&1
wait_worker error
cp "$store/worker-status.json" "$evidence/07-reject-B-with-A-contract.json"
check_active "$a" > "$evidence/08-A-preserved.json"
configure "$audit_b" "$pin_b" > "$evidence/09-configure-B.json"
/bin/sh "$launcher" update --config "$config" > "$evidence/10-stage-B.json"
check_active "$a" > "$evidence/11-A-preserved-before-B-activation.json"
/bin/sh "$launcher" activate --config "$config" --client-closed > "$evidence/12-activate-B.json"
check_active "$b" > "$evidence/13-verify-B.json"
git -C "$source" checkout --detach "$a" > "$evidence/14-ordinary-checkout-A.log" 2>&1
wait_worker error
cp "$store/worker-status.json" "$evidence/15-reject-A-with-B-contract.json"
check_active "$b" > "$evidence/16-B-preserved.json"
configure "$audit_a" "$pin_a" > "$evidence/17-configure-A.json"
git -C "$source" checkout --detach "$a" > "$evidence/18-ordinary-checkout-A.log" 2>&1
wait_worker staged
/usr/bin/osascript -l JavaScript "$evidence/check.js" "$scripts" "$config" candidate "$b" "$a" > "$evidence/19-A-candidate-B-active.json"
for sha in "$a" "$b"; do
    git -C "$source" archive "$sha" src/base.lua > "$evidence/$sha-base.tar"
    /usr/bin/tar -xOf "$evidence/$sha-base.tar" src/base.lua > "$evidence/$sha-base.lua"
done
/usr/bin/osascript -l JavaScript "$evidence/check.js" "$scripts" "$config" base "$b" "$evidence/$b-base.lua" > "$evidence/21-B-source-bytes.json"
/usr/bin/osascript -l JavaScript "$evidence/check.js" "$scripts" "$config" candidate "$b" "$a" "$evidence/$a-base.lua" > "$evidence/22-A-source-bytes.json"
[ -z "$(git -C "$source" status --porcelain --untracked-files=all)" ]
/bin/sh "$launcher" status --config "$config" > "$evidence/20-final-status.json"
echo 'PASS: fresh public A/B artifacts, identity rejection, complete active preservation, ordinary pull/checkout stage-only hooks, fixture activation.'
