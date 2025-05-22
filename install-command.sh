#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0 ]
then
echo "Error:: please run with root user"
exit 1
else
echo "Super.. under the root user only"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
echo "mySQL is not installed... going to install"
dnf install mysql -y
if [ $? eq 0 ]
then
echo "MySQL is installed... SUCCESS"
else
echo "MySQL is not installed... FAILED"
exit 1
fi
else
echo "mySQL is already installed...."
fi




