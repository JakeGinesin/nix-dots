#!/usr/bin/env bash

tmpfile=$(mktemp)
trap 'rm -f "$tmpfile"' EXIT

if (( $# == 0 )); then
  printf 'usage: %s command [arg …]  — or — %s "full pipeline"\n' "$0" "$0" >&2
  exit 1
fi

if (( $# == 1 )); then    
  bash -c "$1" >"$tmpfile"
else      
  "$@" >"$tmpfile"
fi

data=$(cat "$tmpfile")
op="$*"
echo -e "\$ $op\n$data" | perl -p -e 'chomp if eof' | xclip -in -sel clip
rm "$tmpfile"
