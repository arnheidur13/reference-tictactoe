echo "Kil running docker containers"
sudo docker kill $(sudo docker ps -q)

echo "Removing docker containers"
sudo docker rm $(sudo docker --all -q)

echo "Deleting docker images"
sudo docker rmi $(sudo docker images -q)

