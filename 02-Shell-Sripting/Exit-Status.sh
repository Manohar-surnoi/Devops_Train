#!/bin/bash

set -x

lss -ltr

echo "exit status: $?"

ls -ltr

echo "exit status: $?"

USERID=$(id -u)

if [ $USERID -eq 0 ]; then
 echo "running as root user"
else 
 echo "not running as root user"
fi