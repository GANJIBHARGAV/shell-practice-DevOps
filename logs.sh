#!/bin/bash
userid=$(id -u)

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_FILE=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_FILE.log"
PACKAGES=("mysql" "python3" "nginx" "httpd")

mkdir -p $LOGS_FOLDER
echo "Script execution started at $(date)" | tee -a $LOG_FILE
if [ $userid -ne 0 ]
then
echo "Error:: please run with root user" | tee -a $LOG_FILE
exit 1
else
echo "Super.. under the root user only" | tee -a $LOG_FILE
fi
# validate function is used to take input1 as exit status and input2 as server as $1 ans $2
VALIDATE(){
    if [ $1 -eq 0 ]
then
echo "$2 is installed... SUCCESS" | tee -a $LOG_FILE
else
echo "$2 is not installed... FAILED" | tee -a $LOG_FILE
exit 1
fi
}

#using for loop we write the code and minimize all the installation
for package in $@
do
   dnf list installed $package &>>$LOG_FILE
if [ $? -ne 0 ]
then
echo "$package is not installed... going to install" | tee -a $LOG_FILE
dnf install $package -y &>>$LOG_FILE
VALIDATE $? "$package"
else
echo "$package is already installed...." |  tee -a $LOG_FILE
fi
done


# dnf list installed mysql &>>$LOG_FILE
# if [ $? -ne 0 ]
# then
# echo "mySQL is not installed... going to install" | tee -a $LOG_FILE
# dnf install mysql -y &>>$LOG_FILE
# VALIDATE $? "mysql"
# else
# echo "mySQL is already installed...." |  tee -a $LOG_FILE
# fi

# dnf list installed python3 &>>$LOG_FILE
# if [ $? -ne 0 ]
# then
# echo "python3 is not installed... going to install" | tee -a $LOG_FILE
# dnf install python3 -y
# VALIDATE $? "python3"
# else
# echo "python3 is already installed...." | tee -a $LOG_FILE
# fi

# dnf list installed nginx &>>$LOG_FILE
# if [ $? -ne 0 ]
# then
# echo "nginx is not installed... going to install" | tee -a $LOG_FILE
# dnf install nginx -y &>>$LOG_FILE
# VALIDATE $? "nginx"
# else
# echo "nginx is already installed...." | tee -a $LOG_FILE
# fi





