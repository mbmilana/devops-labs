# Case study: Automated backup and security manager

## Task context
Developers test their applications in isolated directories `user_data_1`, ..., `user_data_5` and owerwrite important `access.log` files. Goal: Create an automation script that checks for the existence of a backup directory, packages the project folders into a compressed archive with a timestamp, and restricts access to the archives

## Implementation
The solution is implemented as a bash script using conditional constructs, the `tar` compression utility, environment variables.

## Logic workflow
1. The script defines explicit paths for source and target locations (`BACKUP_DIR` and `SOURCE_DIR`) and generates a `DATE` timestamp using the system `date` utility.
2. The script analyzes the condition and creates the folder if it does not exist.
3. The script navigates to the target execution path (`SOURCE_DIR`) and compresses the target folders using `tar` utility and the `user_data_*` mask.
4. The permissions for the final archive are changed to `700` (`chmod 700`). Access to the backup is now restricted for the group and other system users.

Contents of the `backup_manager.sh`:
```bash
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
```

## Execution results in the terminal
- Archives are successfully created in the background
- Output file name `user_data_backup_2026-09-08_12-30.tar.gz`
- File access rights: `rwx------`
