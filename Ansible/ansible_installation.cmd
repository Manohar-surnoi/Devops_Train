We need to launch two Ec2 instance, One is for Ansible server and other is Node
Firstly, In Ansible server instance we need to install Ansible and should generate public key by using ssh-keygen
Now, we need to connect Node server and will go to (cd .ssh---> cat authorized keys) and we need to paste Public key of ansible server
Now we need to check Ansible and Node connection using (ssh public ip of Node), Then we can create a Directory or file in Ansible server and same time it will reflect in Node
Exit from server, We need to create an Inventory in ansible server using (vi inventory.ini), in Inventory we need to give Node Private ip
Now, we need to give ansible ad-hoc command (ansible -i inventory.ini all -m ping) to check connection between Ansible server and Node
We need to create a playbook (vi ping.yaml) and installing Nginx 
And run Playbook using (ansible-playbook -i invetory.ini ping.yaml)
