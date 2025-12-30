#!/usr/bin/env bash
set -euo pipefail

SEARCH_ROOT="${1:-$HOME}"

if [[ "$SEARCH_ROOT" == "all" ]]; then
    echo "⚠️ Searching full system..."
    sleep 1
    SEARCH_ROOT="/"
fi

# Use fd if available
if command -v fd >/dev/null 2>&1; then
    SEARCH_CMD="fd --type f --type d --hidden --follow --exclude .git . \"$SEARCH_ROOT\""
else
    SEARCH_CMD="find \"$SEARCH_ROOT\" -xdev -type f -o -type d 2>/dev/null"
fi

# --- CACHE SEARCH RESULTS FOR SPEED ---
TMP_CACHE=$(mktemp)
eval "$SEARCH_CMD" > "$TMP_CACHE"

# --- FZF WITH METADATA PREVIEW ---
file=$(cat "$TMP_CACHE" | fzf \
    --height=100% \
    --border=rounded \
    --layout=reverse \
    --ansi \
    --prompt='▶ Search → ' \
    --preview 'stat {} 2>/dev/null || ls -ld {}' \
    --preview-window=right:50%:wrap \
    --bind "ctrl-r:reload:cat $TMP_CACHE"
)

[[ -z "${file:-}" ]] && exit 0

# --- OPEN RANGER ---
tmux new-window -n "Ranger" "cd '$(dirname "$file")' && ranger --selectfile='$(realpath "$file")'"

