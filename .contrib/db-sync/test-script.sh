#!/bin/sh
# The acceptance runner uses only macOS system shell, JXA and repository tools.
set -eu
SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && /bin/pwd -P)
if [ "$(/usr/bin/uname -s)" != Darwin ]; then
    echo 'This suite requires macOS system JXA. Windows preparation requires its separate PowerShell suite.' >&2
    exit 2
fi
if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
    echo "Usage: $0 OUTSIDE_WORKTREE_EVIDENCE_DIRECTORY [CASE_NAME_FILTER]" >&2
    exit 2
fi
/bin/mkdir -p -- "$1"
EVIDENCE_DIR=$(CDPATH= cd -- "$1" && /bin/pwd -P)
exec /usr/bin/osascript -l JavaScript "$SCRIPT_DIR/test-script.js" "$SCRIPT_DIR" "$EVIDENCE_DIR" "${2-}"
