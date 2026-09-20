#!/bin/bash
TARGET_FILE="/etc/hosts"
if [ -f "$TARGET_FILE" ]; then
	echo "File is here! Here are its first three lines:"
	head -3 $TARGET_FILE
else
	echo "Attention! Error: file not found!"
fi
