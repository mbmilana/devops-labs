#!/bin/bash
if [ "$#" -ne 2 ]; then
	echo "Error: Invalid number of arguments."
	echo "Usage: $0 <source_directory> <backup_directory>"
	exit 1
fi

SRC_DIR=$1
DEST_DIR=$2
if [ -d "$SRC_DIR" ]; then
	echo "Target verified. Starting backup routing from $SRC_DIR to $DEST_DIR..."
	if [ ! -d "$DEST_DIR" ]; then
		echo "Backup directory not found. Auto-provisioning: $DEST_DIR"
		mkdir -p "$DEST_DIR"
	fi
	echo "Backup infrastructure successfully prepared."
else
	echo "Critical Error: Source directory $SRC_DIR does not exist!"
	exit 1
fi

