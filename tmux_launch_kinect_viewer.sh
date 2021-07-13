#!/usr/bin/env bash
set -euo pipefail

#!/bin/sh
tmux new-session -d 'roscore'
tmux set-option -g remain-on-exit on
tmux split-window -v 'sleep 1 && nixGL rosrun kinect2_bridge kinect2_bridge'
tmux split-window -h 'sleep 3 && nixGL rosrun kinect2_viewer kinect2_viewer'
tmux -2 attach-session -d
