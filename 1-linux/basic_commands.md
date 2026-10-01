### task 1
go to home directory: 
```bash
cd ~
```
find out the path to the home directory:
```bash
pwd
```
go to the system directory `/etc`:
```bash
cd /etc
```
display files as a list (with sizes and access rights):
```bash
ls -lh
```
add hidden files:
```bash
ls -alh
```
return to home diretory:
```bash
cd ~
```

### task 2
create directory `projects` inside directory `devops`. create directories `project1`, `project2`, `project3` inside directory `projects`
```bash
mkdir -p ./devops/projects/{project1,project2,project3}
```
create empty file `notes.txt` inside directory `project1`
```bash
touch ./devops/projects/project1/notes.txt
```
copy the `notes.txt` file to the directory `project2`and rename the copy to `backup_notes.txt`
```bash
cp ./devops/projects/project1/notes.txt ./devops/projects/project2
mv ./devops/projects/project2/notes.txt ./devops/projects/project2/backup_notes.txt
```
or
```bash
cp ./devops/projects/project1/notes.txt ./devops/projects/project2/backup_notes.txt
```
move `notes.txt` from directory project1 to directory project3
```bash
mv ./devops/projects/project1/notes.txt ./devops/projects/project3
```
delete directory `project1` along with its files
```bash
rm -r ./devops/projects/project1
```

### task 3
display the first 5 lines of the file `/etc/passwd` on the screen
```bash
head -5 /etc/passwd
```
display the last 10 lines of that file on the screen
```bash
tail -10 /etc/passwd
```
find the string `root` in the file `/etc/passwd`
```bash
grep root /etc/passwd
```
display lines from the detailed list of files and directories in the `/etc` folder that contain the words `net` or `network`
```bash
ls -la /etc | grep -E 'network|net'
```

### task 4
open `nano`
```bash
nano
```
create file `myself.txt`\
`Ctrl+O` `myself.txt` `Enter`\
write 3 lines\
save changes and exit\
`Ctrl+O` `Enter` `Ctrl+X`\
open that file to vim
```bash
vim myself.txt
```
add new lines and save changes
`i` `write the text...` `Esc` `:wq`
check the contents of the file
```bash
cat myself.txt
```

### task 6
create a script file and make it executable
```bash
touch ./devops/1-linux/fscript.sh
chmod +x ./devops/1-linux/fscript.sh
```
write code that utomates the following actions: 1) update the list of avaliable programs
```bash
sudo apt update
```
2) check if `cron` process is running
```bash
ps aux | grep [c]ron
```
3) display the top 5 processes using the most RAM
```bash
ps aux --sort=-%mem | head -6
```

### task 7
create a script file
```bash
echo "#!/bin/bash" > ./devops/1-linux/reportscript.sh
create and initialized variables `PROJECT="auto_deploy"` and `LOG_FILE="summary.log"`
```bash
echo "PROJECT=\"auto_deploy\"" >> ./devops/1-linux/reportscript.sh
echo "LOG_FILE=\"summary.log\"" >> ./devops/1-linux/reportscript.sh
```
the script must create directory with mane stored in the variable `PROJECT`
```bash
echo "mkdir -p ./\$PROJECT" >> /devops/1-linux/reportscript.sh
```
report: 1) write the string "=== system report ===" to the file
```bash
echo 'echo "=== system report ===" > ./$PROJECT/$LOG_FILE' >> /devops/1-linux/reportscript.sh
```
2) write the string "Script successfully launced by user $USER"
```bash
echo 'echo "Script successfully launced by user $USER" >> ./$PROJECT/$LOG_FILE' >> /devops/1-linux/reportscript.sh
```
3) write the data to the file
```bash
echo 'echo \"DATE: $(date)" >> ./$PROJECT/$LOG_FILE' >> /devops/1-linux/reportscript.sh
```
add the command that displays the report to the screen
```bash
echo "cat ./\$PROJECT/\$LOG_FILE" >> ./devops/1-linux/reportscript.sh
```
make the script file executable
```bash
chmod +x /devops/1-linux/reportscript.sh
```

contents of the file `./devops/1-linux/reportscript.sh`
```
#!/bin/bash
PROJECT="auto_deploy"
LOG_FILE="summary.log"
mkdir -p $PROJECT
echo "=== system report ===" > ./$PROJECT/$LOG_FILE 
echo "Script successfully launched by user $USER" >> ./$PROJECT/$LOG_FILE
echo "DATE: $(date)" >> ./$PROJECT/$LOG_FILE
cat ./$PROJECT/$LOG_FILE
```
contents of the file `./auto_deploy/summary.log`
```
=== system report ===
Script successfully launched by user mbmilana
DATE: Вс 06 сен 2026 15:02:57 MSK
``

### task 8
create a script file and make it executable
```bash
echo "#!/bin/bash" > ./devops/1-linux/8script.sh
chmod +x ./devops/1-linux/8script.sh
```
create a variable `TARGET_FILE="/etc/hosts"` inside script file
```bash
echo 'TARGET_FILE="/etc/hosts"' >> ./devops/1-linux/8script.sh
```
write a construct that checks for the existence of a file
```bash
echo 'if [ -f "$TARGET_FILE" ]; then
	echo "File is here! Here are its first three lines:"
	head -3 $TARGET_FILE
else
	echo "Attention! Error: file not found!"
fi' >> ./devops/1-linux/8script.sh
```

###  task 9
create a script file and make it executable
```bash
echo "#!/bin/bash" > ./devops/1-linux/9script.sh
chmod +x ./devops/1-linux/9script.sh
```
write `for` loop that executes 5 times. for each value, the script must create a directory named `user_data_n` and an `access.log` file inside it
```bash
echo 'for n in {1..5}
	do
	mkdir ./devop/1-linux/user_data_$n
	touch ./devops/1-linux/user_data_$n/access.log
	done' >> ./devops/1-linux/9script.sh
```
add a command to display the results
```bash
echo "ls -l ./devops/1-linux
	tree ./devops/1-linux" >> ./devops/1-linux/9script.sh
```
execute file
```bash
./devops/1-linux/9script.sh
```

### task 10
create a script file and make it executable
```bash
echo "#!/bin/bash" > ./devops/1-linux/10script.sh
chmod +x ./devops/1-linux/10script.sh
```
store the percentage of used disk space in the variable `DISK_USAGE`
```bash
echo "DISK_USAGE=$(df -h / | tail -n 1 | awk '{print $5}' | cut -d'%' -f1)" >> ./devops/1-linux/10script.sh
```
write `if-else` construct that compares the variable `DISK_USAGE` and the number `80`
```bash
echo 'if [ $DISK_USAGE -gt 80 ]; then' >> ./devops/1-linux/10script.sh
```
if the disk is full, display a message and create a file named `DISK_WARNING.txt` containing a warning at the path `./devops/1-linux`
```bash
echo 'echo "Attention! The disk is $DISK_USAGE% full!" >> ./devops/1-linux/10script.sh
	echo "Clear the disk immidiatelly! Current load: $DISK_USAGE%" >> ./devops/1-linux/DISK_WARNING.txt' >> ./devops/1-linux/10script.sh
```
otherwise? display the appropriate message
```bash
echo 'echo "Everything is great! The disk only $DISK_USAGE% full. There is plenty of space."' >> ./devops/1-linux/10script.sh
fi
```

### task 10
### Linux Architecture, FHS, and Storage Subsystems
inspected the connected block devices and checked active mount points using
```bash
lsblk
df -h
```
extracted CPU model details and RAM capacity directly from the kernel space:
```bash
cd /proc
cat /proc/cpuinfo | head -5
```
simulate manual storage mounting by attaching a temporary `tmpfs` file system directly into the RAM with a strict 50MB limit:
```bash
create the target mount point
```bash
mkdir ~/mnt_test
```
mount a 50MB tmpfs storage
```bash
sudo mount -t tmpfs -o size=50M tmpfs ~/mnt_test
```
verified the new virtual disk allocation
```bash
df -h | grep mnt_test
```
clean up the infrastructure by unmounting the resource
```bash
cd ..
sudo umount ~/mnt_test
```

### task 11
### Process Anatomy, OS Signals, and Memory Diagnostics
tracked the lineage of an interactive shell session and identified parent process IDs (PPID):
```bash
ps axo pid,ppid,cmd
```
simulated hanging process workflows by launching a background execution job:
```bash
sleep 1000 &
```
investigated graceful process termination using the standard system signal:
```bash
pgrep sleep
kill 3816
```
verified process feedback in the primary interactive session terminal:
```bash
# Result: System returned "Terminated" (SIGTERM caught successfully)
```
simulated forced process destruction by sending an uncatchable signal directly to the kernel:
```bash
sleep 1000 &
pgrep sleep
kill -9 3887
```
verified process state destruction in the primary interactive session terminal:
```bash
# Result: System returned "Killed" (SIGKILL enforced by the kernel)
```
monitored live operational memory statistics and active buffer cache allocation:
```bash
free -m
```

### task 12
### Network Stack, Socket Statistics, and Remote HTTP Requests
inspected operational network interfaces and extracted host IP configurations:
```bash
ip a
```
investigated active network sockets, listening TCP/UDP ports, and binding processes:
```bash
sudo ss -tulpn
```
executed a remote non-interactive HTTP network request to capture server metadata headers:
```bash
curl -I https://ya.ru
```

