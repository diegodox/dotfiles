#!/bin/bash

# Rofi script to execute i3 commands
# Internal status is kept on /tmp/rofi-i3-status

status_file=/tmp/rofi-i3-status

action_list=(
    "Scratchpad action"
    "Workspace action"
    "Window action"
)

action_selected() {
    case "$*" in
        "Workspace action")
            echo "Workspace action" > "$status_file"
            for label in "${workspace_action_list[@]}"; do
                echo "$label"
            done
            ;;
        "Window action")
            echo "Window action" > "$status_file"
            for label in "${window_action_list[@]}"; do
                echo "$label"
            done
            ;;
        "Scratchpad action")
            echo "Scratchpad action" > "$status_file"
            echo "Send this window to Scratchpad"
            i3-msg -t get_tree | jq '.nodes[] | .nodes[] | .nodes[] | select(.name=="__i3_scratch") | .floating_nodes[] | .nodes[] | (.name)' \
                | sed 's/^"\(.*\)"$/\1/'
            ;;
    esac
}

workspace_action_list=(
    "Send window to Workspace"
    "Rename Workspace"
    "Focus Workspace"
)

workspace_action() {
    case "$*" in
        "Focus Workspace")
            echo "Focus Workspace" > "$status_file"
            echo "next"
            echo "prev"
            echo "back_and_forth"
            i3-msg -t get_workspaces | jq -r '.[] | "\(.name)"'
            ;;
        "Send window to Workspace")
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
    esac
}

window_action_list=(
    "Send to Workspace"
    "Send to Scratchpad"
    "Toggle Border"
    "Toggle Sticky (Floating Only)"
)

window_action() {
    case "$*" in
        "Send to Workspace")
            echo "Move window to Workspace" > "$status_file"
            echo "next"
            echo "prev"
            echo "back_and_forth"
            i3-msg -t get_workspaces | jq -r '.[] | "\(.name)"'
            ;;
        "Send to Scratchpad")
            i3-msg -t command "move scratchpad" &> /dev/null
            ;;
        "Toggle Border")
            i3-msg -t command 'border toggle' &> /dev/null
            ;;
        "Toggle Sticky (Floating Only)")
            i3-msg -t command 'sticky toggle' &> /dev/null
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
    for command_label in "${action_list[@]}"; do
        echo "$command_label"
    done
else
    # Some arguments passed, then find how to treat them by internal state.
    case $(cat "$status_file") in
        "Workspace action")
            workspace_action "$*"
            ;;
        "Window action")
            window_action "$*"
            ;;
        "Scratchpad action")
            case $* in
                "" | "Send this window to Scratchpad")
                    i3-msg -t command "move scratchpad" &> /dev/null
                    ;;
                *)
                    i3-msg -t command "[title=\"*$**\"] scratchpad show" &> /dev/null
                    ;;
            esac
            ;;
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
            action_selected "$*"
            ;;
    esac
fi
