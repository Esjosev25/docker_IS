# Define a Docker network#
Using a Docker network allows containers to communicate with each other using their container name (--name) rather than an IP address.

To delete or create a network we can use the following:

docker network create --driver bridge <network_name>
For example, to create a network named mynet, we can use:

docker network create --driver bridge mynet
Attach the container to that network in docker run with --net mynet, e.g.,

docker run \
  -d --rm --name mysql \
  -p 3306:3306 \
  --mount "src=mysqldata,target=/var/lib/mysql" \
  -e MYSQL_ROOT_PASSWORD=mysecret \
  --net mynet \
  mysql
# View networks#
The following command lists all the Docker networks:

docker network ls
# Delete a network#
The following command deletes the network specified by its name or ID.

docker network rm <network_id_or_name>
For example, to delete a network named mynet, we can use:

docker network rm mynet
To remove all unused networks that are not currently being used by a running container, use:

docker network prune

# View system disk usage#
docker system df
# Full clean start#
Delete every unused container, image, volume, and network:

docker system prune -a --volumes