#!/usr/bin/env bash

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

tmux set -g @nvim_status_bin "$ROOT/bin"
