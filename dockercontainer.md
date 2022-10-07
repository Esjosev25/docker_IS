# Docker containers
# List containers
Active containers can be viewed with:

docker container ls
docker ps
Also, view stopped containers that have not been removed:

docker container ls -a
# Run a command in a container
To run a command in a container use the following:

docker exec -it <container_id_or_name> [command] [args...]
Example: The following lists the files in the root directory of the container named mysql:

docker exec -it mysql sh -c "ls /"
# Attach to a container shell
The following command allows us to access a container shell to issue commands and examine files:

docker exec -it mysql bash
sh may be necessary for lightweight containers without bash.

Enter exit to quit the shell.

# Restart a container#
We can restart a container by replacing <container_id_or_name> in the following:

docker container restart <container_id_or_name>
Reminder: You can find a container’s name or id by listing the containers.

# Pause a container#
To pause a container replace <container_id_or_name> in the following:

docker container pause <container_id_or_name>
# Unpause a container#
To unpause a container replace <container_id_or_name> in the following:

docker container unpause <container_id_or_name>
# View container metrics#
View the CPU, memory usage, and network activity of all containers:

docker stats
Specific containers can be examined by adding one or more IDs/names to the command.

# Stop a container#
When a container is running in interactive mode (-it), press Ctrl|Cmd + C to stop it. If that fails, or the container is running in the background, use:

docker container stop <container_id_or_name>
To stop the mysql container:

docker container stop mysql
# Remove stopped containers#
To remove a container replace <container_id_or_name> in the following:

docker container rm <container_id_or_name>
Or remove all stopped containers:

docker container prune