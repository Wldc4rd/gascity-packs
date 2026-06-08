#!/bin/sh
# status-line.sh — tmux status-right helper for Gas City agents.
# Usage: status-line.sh <agent-name>
# Called by tmux every status-interval seconds via #(command).
# Always exits 0 — tmux must never see errors.
#
# Counts are cached with a short TTL so tmux's frequent refresh does not fork
# `gc hook` + `gc mail check` (each a gc->bd.real->dolt cascade) on EVERY render
# across EVERY agent — a significant, avoidable share of city fork/CPU load.
# Within the TTL the cached value is reused; the gc calls run at most once per
# TTL per agent. TTL override: GC_STATUSLINE_TTL (seconds).

agent="$1"
[ -z "$agent" ] && exit 0

cache_ttl="${GC_STATUSLINE_TTL:-30}"
safe=$(printf '%s' "$agent" | tr -c 'A-Za-z0-9._-' '_')
cache="${TMPDIR:-/tmp}/gc-statusline-${safe}.cache"

# Reuse the cache if it was written within the TTL window. Uses date+stat
# (portable) rather than find -newermt/-mmin, which some find variants (e.g.
# bfs) reject.
now=$(date +%s 2>/dev/null || echo 0)
mtime=$(stat -c %Y "$cache" 2>/dev/null || echo 0)
if [ "$mtime" -gt 0 ] && [ "$((now - mtime))" -lt "$cache_ttl" ]; then
	read -r w m < "$cache" 2>/dev/null
else
	w=$(gc hook "$agent" 2>/dev/null | grep -c . || true)
	m=$(gc mail check "$agent" 2>/dev/null | awk '{print $1+0}' || true)
	printf '%s %s\n' "${w:-0}" "${m:-0}" > "$cache" 2>/dev/null || true
fi

printf '%s' "$agent"
[ "${w:-0}" -gt 0 ] && printf ' | 🪝 %d' "$w"
[ "${m:-0}" -gt 0 ] && printf ' | 📬 %d' "$m"
