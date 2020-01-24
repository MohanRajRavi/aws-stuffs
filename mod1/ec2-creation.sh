#!/bin/bash

# Authorize TCP, SSH & ICMP for default Security Group
#ec2-authorize default -P icmp -t -1:-1 -s 0.0.0.0/0
#ec2-authorize default -P tcp -p 22 -s 0.0.0.0/0

# The Static IP Address for this instance:
IP_ADDRESS=$(cat ~/.ec2/ip_address)


EC2_RUN_RESULT=$(ec2-run-instances --instance-type t1.micro --group default --region us-east-1 --key $EC2_INSTANCE_KEY --block-device-mapping "/dev/sda1=:16:true" --instance-initiated-shutdown-behavior stop --user-data-file instance_installs.sh ami-cef405a7)

INSTANCE_NAME=$(echo ${EC2_RUN_RESULT} | sed 's/RESERVATION.*INSTANCE //' | sed 's/ .*//')

times=0
echo
while [ 5 -gt $times ] && ! ec2-describe-instances $INSTANCE_NAME | grep -q "running"
do
  times=$(( $times + 1 ))
  echo Attempt $times at verifying $INSTANCE_NAME is running...
done

echo

if [ 5 -eq $times ]; then
  echo Instance $INSTANCE_NAME is not running. Exiting...
  exit
fi


echo
echo Instance $INSTANCE_NAME has been created and assigned static IP Address $IP_ADDRESS
echo

# # Since the server signature changes each time, remove the server's entry from ~/.ssh/known_hosts
# # Maybe you don't need to do this if you're using a Reserved Instance?
# ssh-keygen -R $IP_ADDRESS

# # SSH into my BRAND NEW EC2 INSTANCE! WooHoo!!!
# ssh -i $EC2_HOME/$EC2_INSTANCE_KEY.pem ubuntu@$IP_ADDRESS