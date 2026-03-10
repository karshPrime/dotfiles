#!/usr/bin/env bash

set -euo pipefail

# Create a temporary file for the commit message template
tmp="$(mktemp -t commit-msg.XXXXXX)"
cleanup() { rm -f "$tmp"; }
trap cleanup EXIT

cat >"$tmp" <<'TPL'
# Write your commit message below.
#
# All uncommited changes will be committed to main.
# Ensure all non-template commits are either stashed or commited to this branch.
#
# Lines starting with '#' will be ignored.

TPL
$EDITOR "$tmp"


# Strip comment lines and trailing/leading blank lines for parsing
cleaned="$(mktemp -t commit-msg-clean.XXXXXX)"
trap 'rm -f "$tmp" "$cleaned"' EXIT


# Remove lines starting with '#'
grep -v '^[[:space:]]*#' "$tmp" > "$cleaned" || true


# Trim leading/trailing blank lines
# shellcheck disable=SC2016
awk 'BEGIN{blank=1}
{ if ($0 ~ /^[[:space:]]*$/ && blank==1) next; blank=0; lines[NR]=$0 }
END{
    # remove trailing blanks
    n=NR
    while (n>0 && lines[n] ~ /^[[:space:]]*$/) n--
        for (i=1;i<=n;i++) print lines[i]
        }' "$cleaned" > "${cleaned}.t"
    mv "${cleaned}.t" "$cleaned"


# Extract subject and body
subject="$(sed -n '1p' "$cleaned" | sed 's/[[:space:]]*$//')"   # trim end spaces
body="$(sed '1d' "$cleaned")"

if [ -z "${subject// /}" ]; then
    echo "Aborting: empty commit subject."
    exit 1
fi


# Switch to main

git stash push -u -m "auto: temp before main commit" >/dev/null
git switch main

git stash pop >/dev/null || true
git add -A

# Commit with subject + optional body
if [ -n "${body// /}" ]; then
    git commit -m "$subject" -m "$body"
else
    git commit -m "$subject"
fi

git push


# Return to previous branch and rebase onto updated main
git switch -
git rebase main

