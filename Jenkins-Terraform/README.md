**Terraform Infrastructure for EC2 with Jenkins, Maven, Git, Angular, Docker, and SonarQube**

# Overview
-> Terraform is used to automate the provisioning of EC2 instances and required resources.
-> The infrastructure consists of EC2 instances with Jenkins, Maven, Git, Angular, Docker, and SonarQube installed.
-> These tools will be set up to support continuous integration, deployment, and code quality analysis in the development pipeline.

# Key Features
-> Automated EC2 Provisioning: Deploys an EC2 instance with the necessary tools installed.
-> Jenkins: Continuous integration server for automating build and deployment pipelines.
-> Maven: Build automation tool for Java-based projects.
-> Git: Version control system for managing source code.
-> Angular: Framework for building dynamic web applications.
-> Docker: Containerization platform to run SonarQube and other services.
-> SonarQube: Continuous inspection tool for code quality and security vulnerabilities.
-> Security Group: Configured to allow SSH, HTTP, and required services.
-> Automated Setup: All tools are automatically installed and configured on instance startup via a user_data script.

# Pre-requisites
-> AWS Account: Ensure you have an AWS account with sufficient permissions to create EC2 instances, security groups, and other resources.
-> Terraform: Install Terraform from here.
-> AWS CLI: Install and configure the AWS CLI.
-> SSH Key: Create an SSH key pair for EC2 access.

# Usage Instructions
-> Once the infrastructure is provisioned, you can:
-> Access Jenkins at http://<EC2_Public_IP>:8080.
-> Access SonarQube at http://<EC2_Public_IP>:9000.

# Post-Deployment Configuration
-> Jenkins will be automatically installed and accessible at port 8080.
-> SonarQube will be installed and accessible at port 9000.
-> Maven, Git, Angular, and Docker will be available on the instance.