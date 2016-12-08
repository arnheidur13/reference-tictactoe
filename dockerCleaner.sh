#echo "Kil running docker containers"
#sudo docker kill $(sudo docker ps -a -q)

echo "Stop all running containers"
sudo docker kill $(docker ps -a -q)

echo "Removing docker containers"
sudo docker rm $(sudo docker ps -a -q)

#echo "Deleting docker images"
sudo docker rmi $(sudo docker images -q)
