#!/bin/bash

echo "All the variables in array to denote is $@"
echo "Number of variables passed in script $#"
echo "PID of script is $$"
sleep 10 &
echo "PID of last command in script: $!"