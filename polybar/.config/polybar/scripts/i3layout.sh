#!/bin/bash

layout=`i3-msg -t get_tree | jq -r 'recurse(.nodes[]) | recurse(.floating_nodes[]) | select(.nodes[].focused == true) | if .type == "floating_con" then "float" else .layout end'`
case $layout in
    "splith")
        echo "|"
        ;;
    "splitv")
        echo "-"
        ;;
    "stacked")
        echo "="
        ;;
    "tabbed")
        echo "T"
        ;;
    "float")
        echo "F"
        ;;
    *)
        echo "$layout"
        ;;
esac
