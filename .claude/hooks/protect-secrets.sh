#!/usr/bin/env bash
# PreToolUse hook: refuse any tool call that touches the Sparkle signing key
# in .secrets/ (reading it, printing it, copying it, searching it...).
# Exit code 2 blocks the call and tells Claude why.
input="$(cat)"
if printf '%s' "$input" | grep -qiE '\.secrets|linkraptor-private-key'; then
    echo "Blocked: .secrets/ holds the Linkraptor update-signing key. Claude must not read, print, copy or search it." >&2
    exit 2
fi
exit 0
