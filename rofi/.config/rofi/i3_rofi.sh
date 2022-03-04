#!/bin/bash

# Rofi script to execute i3 commands

command_list=(
    "i3-msg -t command 'border toggle'"
    "i3-msg -t command 'sticky toggle'"
)
command_label_list=(
    "Toggle Border"
    "Toggle Sticky (Floating Only)"
)

if ! command -v i3-msg &> /dev/null; then
    # Print error if i3-msg not found
    echo "Error: i3-msg could not be found."
elif [[ -z "$*" ]]; then
    # No arguments are passed, so display the menu.
    for command_label in "${command_label_list[@]}"; do
        echo "$command_label"
    done
else
    # Some arguments passed, then run corresponding command.
    for ((i = 0; i < ${#command_label_list[@]}; i++)); do
        if [[ "$*" == "${command_label_list[$i]}" ]]; then
            eval "${command_list[$i]} &> /dev/null"
            break
        fi
        echo "Internal Error: i3_rofi.sh" "No such command: $*"
    done
fi
