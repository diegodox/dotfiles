#!/bin/bash

# Rofi script to execute i3 commands
# Internal status is kept on /tmp/rofi-i3-status

status_file=/tmp/rofi-i3-status

command_label_list=(
    "Toggle Border"
    "Toggle Sticky (Floating Only)"
    "Focus Workspace"
    "Move window to Workspace"
    "Rename Workspace"
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
            echo "Focus Workspace" > "$status_file"
            echo "next"
            echo "prev"
            echo "back_and_forth"
            i3-msg -t get_workspaces | jq -r '.[] | "\(.name)"'
            ;;
        "Move window to Workspace")
            echo "Move window to Workspace" > "$status_file"
            echo "next"
            echo "prev"
            echo "back_and_forth"
            i3-msg -t get_workspaces | jq -r '.[] | "\(.name)"'
            ;;
        "Rename Workspace")
            echo "Rename Workspace" > "$status_file"
            echo "current"
            i3-msg -t get_workspaces | jq -r '.[] | "\(.name)"'
            ;;
        *)
            # echo "Internal Error: i3_rofi.sh" "No such command in initial_state: $*"
            ;;
    esac
}

if ! command -v i3-msg &> /dev/null; then
    # Print error if i3-msg not found
    echo "Error: i3-msg could not be found."
elif [[ -z "$*" ]]; then
    # Initialize internal status file
    echo "" > "$status_file"
    # No arguments are passed, so display the menu.
    for command_label in "${command_label_list[@]}"; do
        echo "$command_label"
    done
else
    # Some arguments passed, then find how to treat them by internal state.
    case $(cat "$status_file") in
        "Focus Workspace")
            i3-msg workspace "$*" &> /dev/null
            ;;
        "Move window to Workspace")
            i3-msg move container to workspace "$*" &> /dev/null
            ;;
        "Rename Workspace")
            echo "Rename Workspace selected: $*" > "$status_file"
            echo "Type new workspace name for workspace: $*"
            ;;
        "Rename Workspace selected: "*)
            prev_workspace_name=$(sed 's/Rename Workspace selected: //' < "$status_file")
            case $prev_workspace_name in
                "current")
                    i3-msg -t command "rename workspace to \"$*\"" &> /dev/null
                    ;;
                *)
                    i3-msg -t command "rename workspace \"$prev_workspace_name\" to \"$*\"" &> /dev/null
                    ;;
            esac
            ;;
        *)
            initial_state "$*"
            ;;
    esac
fi
