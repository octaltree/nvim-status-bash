#!/usr/bin/env bash

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

tmux set -g @nvim_eval_statusline "$ROOT/scripts/eval_statusline.sh"
tmux set -g @nvim_exec "$ROOT/scripts/exec.sh"
