#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function main(){
  local f=`tmux show "$1"`
}

main $*
