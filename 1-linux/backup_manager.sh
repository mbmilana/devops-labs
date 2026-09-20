#!/bin/bash
BACKUP_DIR="./devops/1-linux/my_backups"
SOURCE_DIR="./devops/1-linux"
DATE=$(date +%F_%H-%M)
if [ -d "$BACKUP_DIR" ]; then
echo "The backup folder is in place. Starting the archiving process"
else
echo "The backup folder not found. Create a new folder..."
mkdir -p $BACKUP_DIR
ARCHIVE_NAME="$BACKUP_DIR/user_data_$DATE.tar.gz"
cd $SOURCE_DIR
tar -czf $ARCHIVE_NAME user_data_*
echo "The $ARCHIVE_NAME has been successfully created"
chmod 700 $ARCHIVE_NAME
