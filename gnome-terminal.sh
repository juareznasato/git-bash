#!/bin/bash
gnome-terminal --working-directory="$(cd "$(dirname "$1")"; pwd -P)/$(basename "$1")" -- sh "./git/start.sh"
