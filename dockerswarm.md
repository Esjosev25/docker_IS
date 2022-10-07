# See docker information
docker system info

# init docker swarm 
docker swarm init

# pull an image
docker pull estuardov25/nodehello

# create a service taht launches a container on the swarm
docker service create --name nodehello -p 3000:3000 \
  estuardov25/nodehello
# scale a swarm service
docker service scale nodehello=3

# see docker services
docker service ls

# delete a service
docker service rm nodehello

## force leave docker swarm
docker swarm leave --force