#!/bin/bash
PROJECT="auto_deploy"
LOG_FILE="summary.log"
mkdir -p $PROJECT
echo "=== system report ===" > ./$PROJECT/$LOG_FILE 
echo "Script successfully launched by user $USER" >> ./$PROJECT/$LOG_FILE
echo "DATE: $(date)" >> ./$PROJECT/$LOG_FILE
cat ./$PROJECT/$LOG_FILE
