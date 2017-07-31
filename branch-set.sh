#!/bin/bash

set -e
set -o pipefail
function getRepos() {
  for repo in "$1"/*; do
    if (cd "$repo"/.git); then
      printf "Repo name: %s\n" "$repo"
      $setRemote cd "$repo" "$2"
    fi
  done
}
getRepos "$1" "$2"

function setRemote() {
  cd "$1"
  dir=(pwd | grep -o "[^/]*$")
  git remote set-url origin "http://github.com/{$2}/{$dir}.git"
}
