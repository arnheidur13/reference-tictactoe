#!/bin/bash

#Copy docker-compose from jenkins Commit project to AWS EC2 instance"
scp -o StrictHostKeyChecking=no -i my-ec2-key-pair.pem "Commit/build/docker-compose.yml" ec2-user@35.162.181.184:~/docker-compose.yml

#Copy .env file holding the current githash tag for latest built Docker image
scp -o StrictHostKeyChecking=no -i my-ec2-key-pair.pem "Commit/build/.env" ec2-user@35.162.181.184:~/.env

echo "SSH from jenkins to AWS instance"
ssh -o StrictHostKeyChecking=no -i my-ec2-key-pair.pem ec2-user@35.162.181.184 "docker-compose up -d"

exit
