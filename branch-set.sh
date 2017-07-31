#!/bin/bash

set -e
set -o pipefail
function setBranches() {
  for repo in "$1"/*; do
    if (cd "$repo"/.git); then
      curRemote=$(cat "$repo"/.git/config | grep -E "url")
      sed -i "" "s/$2/$3/" "$repo"/.git/config
      newRemote=$(cat "$repo"/.git/config | grep -E "url")
      printf "Repo name: \t\t%s\nCurrent branch: %s\nNew branch: \t%s\n" "$repo" "$curRemote" "$newRemote"
    fi
  done
}
setBranches "$1" "$2" "$3"
