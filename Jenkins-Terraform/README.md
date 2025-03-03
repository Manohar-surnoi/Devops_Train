Terraform Infrastructure for EC2 with Jenkins, Maven, Git, Angular, Docker, and SonarQube

This repository contains Terraform configuration files to provision an EC2 instance on AWS with Jenkins, Maven, Git, Angular, Docker, and SonarQube installed using separate shell scripts for Jenkins and SonarQube.

Prerequisites
Before running the Terraform scripts, ensure you have the following:

Terraform installed: Terraform Downloads
AWS Account with appropriate IAM permissions to create EC2 instances and security groups.
AWS CLI configured with valid credentials: AWS CLI Setup
SSH Key for accessing the EC2 instance.
Terraform Configuration Overview
This Terraform configuration will:

Provision an EC2 instance on AWS.
Use separate shell scripts to install:
Jenkins (jenkins.sh)
SonarQube (sonarqube.sh)
Java, Maven, Git, Angular, and Docker are installed within the install_dependencies.sh script.
Set up a security group to allow HTTP (port 80), SSH (port 22), Jenkins (port 8080), and SonarQube (port 9000) access.
Customize server names, security group names, and manage configuration metadata using variables.
Automatically use the default VPC and default subnet for provisioning the EC2 instance.
Directory Structure
plaintext
Copy
.
├── main.tf               # Main Terraform configuration file
├── variables.tf          # Variables file to define AWS region, AMI ID, and other parameters
├── outputs.tf            # Outputs file to display instance information after provisioning
├── terraform.tfvars      # File for variable values (Optional)
├── install_dependencies.sh # Shell script to install Java, Maven, Git, Angular, Docker
├── jenkins.sh            # Shell script to install Jenkins
├── sonarqube.sh          # Shell script to install SonarQube
├── README.md             # This file
Shell Scripts:
1. install_dependencies.sh
This script installs the following tools on the EC2 instance:

Java: Installs OpenJDK.
Maven: Installs Apache Maven.
Git: Installs Git.
Angular CLI: Installs Angular CLI globally.
Docker: Installs Docker.

Sample install_dependencies.sh:
bash
Copy
#!/bin/bash

# Update and install dependencies
sudo apt-get update -y
sudo apt-get upgrade -y

# Install Java
sudo apt-get install openjdk-11-jdk -y
java -version

# Install Maven
sudo apt-get install maven -y
mvn -v

# Install Git
sudo apt-get install git -y
git --version

# Install Node.js (required for Angular CLI)
sudo apt-get install -y nodejs npm

# Install Angular CLI globally
sudo npm install -g @angular/cli
ng version

# Install Docker
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update -y
sudo apt-get install docker-ce -y
sudo systemctl start docker
sudo systemctl enable docker
echo "Docker has been installed."
This script handles the installation of the Java, Maven, Git, Angular, and Docker software.

2. jenkins.sh
The jenkins.sh script installs Jenkins on the EC2 instance:

bash
Copy
#!/bin/bash

# Install Jenkins
wget -q -O - https://pkg.jenkins.io/keys/jenkins.io.key | sudo apt-key add -
echo "deb http://pkg.jenkins.io/debian/ stable main" | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt-get update -y
sudo apt-get install jenkins -y
sudo systemctl start jenkins
sudo systemctl enable jenkins
echo "Jenkins has been installed and started."
This script installs Jenkins and starts the service. Jenkins will be available on port 8080.

3. sonarqube.sh
The sonarqube.sh script installs SonarQube in a Docker container:

bash
Copy
#!/bin/bash

# Install SonarQube using Docker
sudo docker pull sonarqube:latest
sudo docker run -d -p 9000:9000 --name sonarqube sonarqube
echo "SonarQube is now running on port 9000."
This script pulls the latest SonarQube Docker image and runs it on port 9000.

Variables
The following variables are defined in the variables.tf file and can be customized in the terraform.tfvars file (or via the command line):

Available Variables:
ami_id: The Amazon Machine Image (AMI) ID of the EC2 instance to be launched.
instance_type: EC2 instance type (e.g., t2.micro, t2.medium).
region: AWS region for provisioning the EC2 instance (e.g., us-west-2).
key_name: Name of the SSH key pair to access the EC2 instance.
security_group_name: Name of the security group.
server_name: The name of the EC2 instance (can be any descriptive name like jenkins-server).
managed_by: The name or identifier of the team/person managing the infrastructure (e.g., DevOps Team).
Example terraform.tfvars:
hcl
Copy
ami_id            = "ami-xxxxxxxxxxxxxxxxx"
instance_type     = "t2.micro"
region            = "us-west-2"
key_name          = "your-ssh-key-name"
security_group_name = "jenkins-security-group"
server_name       = "jenkins-server"
managed_by        = "DevOps Team"
Important Notes:
VPC: This setup uses the default VPC in your AWS account. You do not need to specify a VPC, as the instance will automatically be created in the default VPC.
Subnet: Since no subnet is specified, Terraform will create the EC2 instance in the default subnet within the default VPC.
Steps to Deploy Infrastructure
Step 1: Clone the Repository
bash
Copy
git clone https://github.com/your-username/terraform-ec2-jenkins-maven-docker-sonarqube.git
cd terraform-ec2-jenkins-maven-docker-sonarqube
Step 2: Initialize Terraform
Run the following command to initialize the Terraform environment and download the necessary provider plugins:

bash
Copy
terraform init
Step 3: Customize the Variables (Optional)
Edit the terraform.tfvars file or modify the variables.tf file to specify your own values for the variables listed above. This includes things like the AMI ID, instance type, security group, etc.

Step 4: Apply the Terraform Plan
Run the following command to review and apply the Terraform configuration:

bash
Copy
terraform apply
Terraform will prompt for confirmation before provisioning the resources. Type yes to continue.

Step 5: Access the EC2 Instance
Once the EC2 instance is up, Terraform will output the public IP address of the instance. You can access the instance via SSH using the following command:

bash
Copy
ssh -i path-to-your-ssh-key.pem ubuntu@<instance_public_ip>
Step 6: Run the Shell Scripts
Jenkins: After accessing the EC2 instance, run the jenkins.sh script to install Jenkins:

bash
Copy
sudo bash jenkins.sh
SonarQube: Run the sonarqube.sh script to install SonarQube:

bash
Copy
sudo bash sonarqube.sh
Java, Maven, Git, Angular, Docker: These will be installed automatically when the EC2 instance is launched, as part of the install_dependencies.sh script.

Step 7: Access Jenkins, Maven, Git, Angular, Docker, and SonarQube
Jenkins: After running the jenkins.sh script, Jenkins will be available on port 8080 (e.g., http://<instance_public_ip>:8080).
SonarQube: After running the sonarqube.sh script, SonarQube will be available on port 9000 (e.g., http://<instance_public_ip>:9000).
Maven: Maven will be available system-wide on the EC2 instance. To verify, run mvn -v in the terminal.
Git: Git will be installed globally. You can verify by running git --version.
Angular: Angular CLI will be installed globally. Verify by running ng version.
Docker: Docker will be installed and running. You can verify by running docker --version.
Terraform Outputs
After the provisioning is complete, Terraform will output the following:

instance_public_ip: Public IP of the EC2 instance.
instance_private_ip: Private IP of the EC2 instance.
Clean Up
To destroy the resources created by Terraform, run the following command:

bash
Copy
terraform destroy
This will terminate the EC2 instance and remove all associated resources.

Troubleshooting
If Jenkins is not accessible, check the security group to ensure that port 8080 is open.
If SonarQube is not accessible, check the security group to ensure that port 9000 is open.
If Maven, Git, Angular, Docker, or SonarQube are not installed correctly, check the EC2 instance logs for any installation errors.
License
This project is licensed under the MIT License - see the LICENSE file for details.

Key Changes:
Two Separate Scripts: Now the installation of Jenkins and SonarQube is handled by the separate jenkins.sh and sonarqube.sh scripts, respectively.
Execution Order: Users will need to run the jenkins.sh and sonarqube.sh scripts manually after the EC2 instance is provisioned.
Let me know if you need further adjustments!