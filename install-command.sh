#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0 ]
then
echo "Error:: please run with root user"
exit 1
else
echo "Super.. under the root user only"
fi

dnf install mysql -y
if [ $? -eq 0 ]
then 
echo "Installing mySQL... SUCESSS"
else
echo "Installing mySQL... FAILURE"
exit 1
fi