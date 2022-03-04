#!/bin/bash

# Rofi script to execute i3 commands
# Internal status is kept on /tmp/rofi-i3-status

command_label_list=(
    "Toggle Border"
    "Toggle Sticky (Floating Only)"
    "Focus Workspace"
    "Move window to Workspace"
)

initial_state() {
    case "$*" in
        "Toggle Border")
            i3-msg -t command 'border toggle' &> /dev/null
            ;;
        "Toggle Sticky (Floating Only)")
            i3-msg -t command 'sticky toggle' &> /dev/null
            ;;
        "Focus Workspace")
            echo "Focus Workspace" > /tmp/rofi-i3-status
            i3-msg -t get_workspaces | jq -r '.[] | "\(.name)"'
            ;;
        "Move window to Workspace")
            echo "Move window to Workspace" > /tmp/rofi-i3-status
            i3-msg -t get_workspaces | jq -r '.[] | "\(.name)"'
            ;;
        *)
            # echo "Internal Error: i3_rofi.sh" "No such command in initial_status: $*"
            ;;
    esac
}

if ! command -v i3-msg &> /dev/null; then
    # Print error if i3-msg not found
    echo "Error: i3-msg could not be found."
elif [[ -z "$*" ]]; then
    # Initial state file
    echo "" > /tmp/rofi-i3-status
    # No arguments are passed, so display the menu.
    for command_label in "${command_label_list[@]}"; do
        echo "$command_label"
    done
else
    # Some arguments passed, then find how to treat them by state.
    case $(cat /tmp/rofi-i3-status) in
        "Focus Workspace")
            i3-msg workspace "$*" &> /dev/null
            ;;
        "Move window to Workspace")
            i3-msg move container to workspace "$*" &> /dev/null
            ;;
        *)
            initial_state "$*"
            ;;
    esac
fi
