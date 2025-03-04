#!/bin/bash  

#################################################
# Created : Manohar Nandelli
# Purpose : git, Jenkins, Maven, Node.js, and Angular configuration
#################################################

# Colors
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="/tmp/jenkins_installation_log_$TIMESTAMP.log"
ID=$(id -u)

echo "script started at $TIMESTAMP" &>> $LOG_FILE

# Validate command
VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "$2 process $R FAILED $N"
        exit 1
    else
        echo -e "$2 process $G SUCCESS $N"
    fi
}

# Check root access to script
if [ $ID -ne 0 ]; then
    echo -e "$R Error:: Provide root access to the script $N" 
    exit 1
fi

echo "--------- Wait for a while, configuration is in progress --------------- "

# Git installation
yum list installed git &>> $LOG_FILE
if [ $? -ne 0 ]; then
    yum install git -y &>> $LOG_FILE
    VALIDATE $? "Git Installation"
else
    echo -e "Git already Installed $Y SKIPPING $N"
fi

echo "git version: $(git --version)"

# Java installation
yum list installed java &>> $LOG_FILE
if [ $? -ne 0 ]; then
    yum install java-21-amazon-corretto-devel -y &>> $LOG_FILE
    VALIDATE $? "Java-21 Installation"
else
    echo -e "Java-21 already Installed $Y SKIPPING $N"
fi

# Remove previous downloads and renamed components
rm -rf ap* maven

# Add Jenkins repository and install Jenkins
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo &>> $LOG_FILE
VALIDATE $? "Added Jenkins repo"

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key &>> $LOG_FILE
VALIDATE $? "Imported Jenkins CI key"

yum list installed jenkins &>> $LOG_FILE
if [ $? -ne 0 ]; then
    yum install jenkins -y &>> $LOG_FILE
    systemctl enable jenkins &>> $LOG_FILE
    systemctl start jenkins &>> $LOG_FILE
    VALIDATE $? "Jenkins Installation and Startup"
else
    echo -e "Jenkins already Installed $Y SKIPPING $N"
fi

# Node.js installation
yum list installed nodejs &>> $LOG_FILE
if [ $? -ne 0 ]; then
    curl -fsSL https://rpm.nodesource.com/setup_20.x | bash - &>> $LOG_FILE
    yum install nodejs -y &>> $LOG_FILE
    VALIDATE $? "Node.js Installation"
else
    echo -e "Node.js already Installed $Y SKIPPING $N"
fi

# Display Node.js and npm versions
echo "Node version: $(node --version)"
echo "npm version: $(npm --version)"

# Angular installation
ng version &>> $LOG_FILE
if [ $? -ne 0 ]; then
    npm install -g @angular/cli@latest &>> $LOG_FILE
    VALIDATE $? "Angular Installation"
else
    echo -e "Angular already Installed $Y SKIPPING $N"
fi

# Display Angular version
echo "Angular version: $(ng version)"

# Maven installation
cd /opt

# Download Maven binary
wget https://archive.apache.org/dist/maven/maven-3/3.9.8/binaries/apache-maven-3.9.8-bin.tar.gz &>> $LOG_FILE

# Extract and install Maven
tar xvf apache-maven-3.9.8-bin.tar.gz &>> $LOG_FILE
mv apache-maven-3.9.8 maven
rm -rf apache-maven-3.9.8

# Add Maven to PATH
maven_bin_dir="/opt/maven/bin"
if [[ ! "$PATH" =~ "/opt/maven/bin" ]]; then
    export PATH="$PATH:$maven_bin_dir"
fi

echo "Maven bin directory added to PATH: $PATH"

# Return to previous directory
cd -

# Display Maven version
echo "Maven version: $(mvn --version)"
