#!/usr/bin/env bash

if command -v picom 2>&1 /dev/null
then
	#picom -b --mark-wmwin-focused
else
	echo "picom not found"	
fi

