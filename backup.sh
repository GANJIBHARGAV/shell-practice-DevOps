#!/bin/bash
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3: -14} #  If days it will take that day count otherwise default 14 days

USERID=$(id -u)
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_FILE=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_FILE.log"

mkdir -p $LOGS_FOLDER

if [ $USERID -ne 0 ]
then 
echo "Error: your not under the root user. Please check"
else
echo "Super you are under root user" | tee $LOG_FILE
fi

VALIDATE(){
if [ $? eq 0 ]
then 
echo "$1 is sucess....." | tee $LOG_FILE
else
echo "$2 is failed....." | tee $LOG_FILE
fi
}

USAGE(){
    echo "USAGE:: sh backup.sh source_dir and dest_dir days(optional)"
}

if [ $# -lt 2 ]
then 
USAGE
fi

if [ ! -d $SOURCE_DIR ]
then 
echo "No source directory exists.Please check"
exit 1
fi

if [ ! -d $DEST_DIR ]
then
echo "No destination exists.Please check"
exit 1
fi

FILES=$(file $SOURCE_DIR -name "*.log" -mtime +$DAYS)
if [ ! -z $FILES ]
then
echo "Files to be zipped are:$FILES" 
else
echo "No files are available under 14 days"







