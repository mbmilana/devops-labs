#1/bin/bash
DISK_USAGE=59
if [ $DISK_USAGE -gt 40 ]; then
echo "Attention! The disk is $DISK_USAGE% full!"
echo "Clear the disk immidiatelly! Current load: $DISK_USAGE%" > ./devops/1-linux/DISK_WARNING.txt
else
echo "Everything is great! The disk only $DISK_USAGE% full. There is plenty of space."
fi
