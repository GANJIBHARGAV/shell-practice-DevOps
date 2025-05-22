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
echo "MySQL is not installed.. going to install"
dnf install mysql -y
if [ $? -eq 0 ]
then 
echo "MySQL is installing ...SUCCESS"
else
echo "mySQL is installing... FAILURE"
exit 1
fi
else
echo "mySQL is already installed.. No need to do it again"
fi




