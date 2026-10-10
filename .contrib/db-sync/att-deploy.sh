#!/bin/sh
# Uses the operating system shell and JXA; no added language runtime.
set -eu
script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)
case "$(uname -s)" in
  MINGW*|MSYS*|CYGWIN*) exec powershell.exe -NoLogo -NoProfile -File "$script_dir/att-deploy.ps1" "$@" ;;
  Darwin) ;;
  *) echo 'ATT script deployment: supported deployment platforms are macOS and Windows.' >&2; exit 1 ;;
esac
if [ "${1-}" = --pinned ]; then
  [ "$#" -ge 2 ] || exit 1
  expected=$2
  shift 2
  case "$expected" in *[!0-9a-f]*|'') exit 1 ;; esac
  [ "${#expected}" -eq 64 ] && [ "$(basename -- "$script_dir")" = "$expected" ] || exit 1
  check=$script_dir
  while [ "$check" != / ]; do [ ! -L "$check" ] || exit 1; check=$(dirname -- "$check"); done
  [ -f "$script_dir/inventory.txt" ] && [ ! -L "$script_dir/inventory.txt" ] || exit 1
  actual=$(/usr/bin/shasum -a 256 -- "$script_dir/inventory.txt"); actual=${actual%% *}
  [ "$actual" = "$expected" ] || { echo 'ATT script inventory changed; refusing execution.' >&2; exit 1; }
  wanted='att-artifact.js
att-core.js
att-deploy.sh
att-snapshot.js
att-store.js
inventory.txt'
  [ "$(/bin/ls -A -- "$script_dir")" = "$wanted" ] || { echo 'Unexpected script bundle content; refusing execution.' >&2; exit 1; }
  while IFS=' ' read -r digest name; do
    [ -n "$digest" ] || continue
    case "$name" in att-artifact.js|att-core.js|att-deploy.sh|att-snapshot.js|att-store.js) ;; *) exit 1 ;; esac
    [ -f "$script_dir/$name" ] && [ ! -L "$script_dir/$name" ] || exit 1
    actual=$(/usr/bin/shasum -a 256 -- "$script_dir/$name"); actual=${actual%% *}
    [ "$actual" = "$digest" ] || { echo 'Installed ATT script changed; refusing execution.' >&2; exit 1; }
  done < "$script_dir/inventory.txt"
else
  [ "${1-}" != __locked ] || { echo 'Internal locked invocation requires a verified installed bundle.' >&2; exit 1; }
fi
exec /usr/bin/osascript -l JavaScript "$script_dir/att-core.js" "$@"
