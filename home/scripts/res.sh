#!/usr/bin/env bash
export SCREEN_RES=$(xrandr | grep "*" | awk '{print $1}')
