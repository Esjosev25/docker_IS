# Comands
.# a comment
FROM	build the image from a Docker Hub starting image
ARG	define a variable that can be passed by the build command
ENV	set an environment variable
WORKDIR	set a working directory
USER	set the active user
VOLUME	create a volume mount point so that directory can be accessed from other containers in the Docker network
RUN	execute a command, such as npm install to download modules
COPY	copy files from the host machine
EXPOSE	expose a port to the host
CMD	default launch command (which can be overridden)
ENTRYPOINT	default launch command for executable images