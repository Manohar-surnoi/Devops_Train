#!/bin/bash

USERID=$(id -u)

if [$USERID -ne 0]; then
        echo " you need to be root user to execute script"
        exit 1
fi

yum install git

if [$USEDID -ne 0]; then
        echo " Installing git is failure"
        exit 1
else
        echo " Installing git is success"
fi

#In shell scripting, you can execute commands conditionally using "If Else" statements. This allows you to control the flow of your script and perform different actions based on specific conditions.