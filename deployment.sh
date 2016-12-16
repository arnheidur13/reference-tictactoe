#!/bin/bash

#Copy docker-compose from jenkins Commit project to AWS EC"
scp -o StrictHostKeyChecking=no -i "/var/lib/jenkins/my-ec2-key-pair.pem" /var/lib/jenkins/workspace/Commit/build/docker-compose.yml ec2-user@35.162.181.184:~/docker-compose.yml

#Adjust to the previous
scp -o StrictHostKeyChecking=no -i "var/lib/jenkins/my-ec2-key-pair.pem" var/lib/jenkins/workspace/Commit/build/.env ec2-user@35.162.181.184:~/.env

#echo "Moving up to root..."
#cd ..
#cd ..

#chmod 400 my-ec2-key-pair.pem

#ls -a 

echo "SSH from jenkins to AWS instance"
ssh -o StrictHostKeyChecking=no -i /var/lib/jenkins/my-ec2-key-pair.pem ec2-user@35.162.181.184 "docker-compose up -d"

exit

# Laga path (relative vs. absolute)