#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0 ]
then
echo "Error:: please run with root user"
exit 1
else
echo "Super.. under the root user only"
fi

VALIDATE(){
    if [ $1 -eq 0 ]
then
echo "$2 is installed... SUCCESS"
else
echo "$2 is not installed... FAILED"
exit 1
fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then
echo "mySQL is not installed... going to install"
dnf install mysql -y
VALIDATE $? "mysql"
else
echo "mySQL is already installed...."
fi

dnf list installed python3
if [ $? -ne 0 ]
then
echo "python3 is not installed... going to install"
dnf install python3 -y
VALIDATE $? "python3"
else
echo "python3 is already installed...."
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
echo "nginx is not installed... going to install"
dnf install nginx -y
VALIDATE $? "nginx"
else
echo "nginx is already installed...."
fi





