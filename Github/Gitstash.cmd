---
 - name: first playbook
   hosts: all
   become: yes
   tasks: 
       - name: install httpd
         yum:
             name: httpd
             state: present
       - name: start httpd
         service:
              name: httpd
              state: started
       



        
               
                   