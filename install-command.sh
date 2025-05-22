#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0 ]
then
echo "Error:: please run with root user"
exit 1
else
echo "Super.. under the root user only"
fi