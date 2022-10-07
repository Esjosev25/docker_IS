Docker Volumes
View Docker volumes
Volumes are Docker-managed disks mounted into a container (using --mount) to provide persistent storage between restarts. List created volumes using the following command:

docker volume ls
Delete a volume
To delete a volume we can use the following:

docker volume rm <volume_name>
For example, to delete a volume named mysqldata, we can use:

docker volume rm mysqldata
Or to remove all unused volumes not currently attached to a running container:

docker volume prune
These commands work if the container, whose volume you want to delete, is stopped and removed.

Bind mount a host directory
A directory on the host can be mounted into a container using the -v hostdir:containerdir option with the docker run command. For example, the following command mounts the current directory’s code subdirectory to the container’s /home/app directory:

-v $PWD/code:/home/app
$PWD references the current directory on Linux and macOS. It is not available on Windows so the full path must be specified using forward-slash notation, e.g.,

-v /c/project/code:/home/app