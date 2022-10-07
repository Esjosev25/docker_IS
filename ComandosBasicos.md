# Comandos para el cli
-d	run a container as a background process (which exits when the application ends)<br>
-it	keep a container running in the foreground (even after the application ends), and show an activity log<br>
--rm	remove the container after it stops<br>
--name	name a container (a random GUID is used otherwise)<br>
-p	map a host port to a container port<br>
--mount	create a persistent Docker-managed volume to retain data. The string specifies a src volume name and a target where it mounted in the container's file system<br>
-v	mount a host folder using the notation <hostdir>:<containerdir> <br>
-e	define an environment variable<br>
--env-file	read environment variables from a file where each line defines a VAR=value<br>
--net	connect to specific Docker network<br>
--entrypoint	override the default starting application<br>


# See information

## See all running containers
docker container ls | docker container ls -a

## See all images active and not associated with a container
docker image ls -a

## See all containers
docker ps -a

##  View all Docker managed disc volumes
docker volume ls

## See all docker network
docker network ls

## Ver informacion de disco de los contenedores
docker system df


# Delete and manage containers
## Delete a container
docker container rm <name>

## Delete all stopped containers
docker container prune

## Delete unused docker volumes (CONTAINERS NOT RUNNING)
docker volume prune

## Pause a container
docker container pause <name>
docker container unpause <name>

## Restart containers
docker container restart <name> <othername>

## Stop container
docker container stop <name>

## Create a network
docker network create --driver bridge <netname>'

# Create images
## build image
docker image build -t <customname> .

## List all images
docker image ls | docker image ls -a

## launch custom image
docker run -it --rm --name <customname> -p 3000:3000 nodehello

## create an image from acontainer
docker commit [CONTAINER_NAME] [IMAGE_NAME]

## Image names and tags
[your_user_name]/[image_name]:[tag_name]