#!/bin/bash 

set -x

Person1=Manohar
Person2=Kiran
Person3=Royal
Number1=65
Number2=64
Number3=63

echo "Hello ${Person1} ${Person2} ${Person3}"
echo "${Number1} ${Number2} ${Number3}"

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

#"With using set -x in script, we will know execution of each command before printing output"