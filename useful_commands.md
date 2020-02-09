# USEFUL COMMANDS
Please refer the page for any commands.

## GIT Commands
#### git clone <repo URL>
### Make some changes
#### git status
####  git add .
#### git commit -m "changes"
#### git push -u origin master

## APT-PACKAGE MANAGER COMMANDS FOR AWS-CLI
## add sudo if permission is required
#### apt-get update
#### apt-get install python3
#### apt-get install awscli
#### aws --version
#### aws configure
#### aws ec2 describe-instances --instance-ids 
#### aws ec2 describe-instances --filters Name=instance-type,Values=m5.large
#### aws ec2 run-instances --image-id MY_AMI_NAME --count 1 --instance-type t2.micro --key-name MyKeyPair --security-group-ids sg-903004f8 --subnet-id subnet-6e7f829e
#### aws ec2 create-tags --resources i-5203422c --tags Key=Name,Value=MyInstance
#### aws ec2 describe-instances --filters "Name=instance-type,Values=t2.micro" --query "Reservations[].Instances[].InstanceId"
#### aws ec2 terminate-instances --instance-ids i-5203422c

## Basic UNIX Commands
#### ls -lart (l- long list; a - hidden files; r - reverse lookup; t - time)
#### cd (change directory, by default home directory, other than specify the dir name, eg:- cd .aws)
#### cat filename (to read a file)
#### vi filename (to edit a file)
#### rm filename (remove a file)
#### date (to print the date)
#### #!/bin/bash (sha-bang for scripting)
#### pwd (present working directory)

## LAMP STACK SETUP
#### sudo yum update -y
#### sudo yum install -y httpd php mysql-server php-mysqlnd
#### sudo service httpd start
#### sudo chkconfig httpd on


#### ssh -i <path to pem file>aws_key.pem ec2-user@ip

## Advanced LAMP setup
#### #!/bin/bash
#### sudo yum update -y
#### sudo yum install -y httpd php
#### sudo service httpd start
#### sudo chown -R ec2-user:ec2-user /var/www/
#### sudo usermod -a -G apache ec2-user
#### echo "<?php phpinfo(); ?>" >> /var/www/html/demo.php

