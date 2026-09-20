#!/bin/bash
for n in {1..5}
do
mkdir -p ./devops/1-linux/user_data_$n
touch ./devops/1-linux/user_data_$n/access.log
done
ls -l ./devops/1-linux
tree ./devops/1-linux
