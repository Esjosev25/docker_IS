# Docker Compose#
Docker Compose is a utility for launching and managing multiple containers. It is more powerful and easier than using a series of docker run commands.

The configuration is usually defined in a docker-compose.yml (YAML) file. This lesson provides a summary of the commands that will be used most often in your Docker journey.

YML is a standard data format using new lines, tabs, colons, and dashes to indicate sections and data.

All configuration files must specify:

Docker Compose version compatibility.
The services (containers) to launch.
The networks (if used).
The volumes (if used).
version: '3'

services:

 #container
  mycontainer:
    # #...definition...


networks:

volumes:
The following sections describe common settings used to configure service containers for Docker Compose v3 and above.

# Use or build image#
Specify a starting repository image, e.g., for the latest MySQL:

  mycontainer:
    image: mysql
A new image can be built by specifying the relative path context, the name of the dockerfile in that location, and any associated build args passed to Dockerfile ARG instructions:

  mycontainer:
    build:
      context: ./
      dockerfile: Dockerfile
      args:
        - arg1=val1
        - arg2=val2
        - arg3=val3
# Set the container_name#
Set the container name. This can be used for inter-container communications across the same Docker network:

  mycontainer:
    container_name: mycontainer
# Container depends_on another#
Express a dependency between services to ensure one or more other containers have started before launching this one:

  mycontainer:
    depends_on:
      - containerA
      - containerB
# Set environment variables#
Define any number of individual environment variables:

  mycontainer:
    environment:
      - MYVAR1=value1
      - MYVAR2=value2
      - MYVAR3=value3
Sets of environment variables can be defined in a .env file, e.g.

 #example values
MYVAR1=value1
MYVAR2=value2
MYVAR3=value3
All values can be imported using env_file::

  mycontainer:
    env_file: .env
Multiple files can also be specified:

  mycontainer:
    env_file:
      - ./one.env
      - ./two.env
      - ./three.env
# Attach to Docker networks#
Join one or more Docker networks (created on first use):

  mycontainer:
    networks:
      - mynetwork
It is also possible to set aliases (alternative hostnames) and IP addresses for the container on the network:

  mycontainer:
    networks:
      mynetwork:
        aliases:
          - myname1
          - myname2
        ipv4_address: 172.16.238.20
        ipv6_address: 2001:3984:3989::20
The networks (and optional configurations) must be referenced after the services: definition at the bottom of docker-compose.yml:

networks:
  mynetwork:

# Attach persistent Docker volumes
Mount a Docker volume (created on first use) or bind a host directory:

  mycontainer:
    volumes:

      #Docker volume
      - type: volume
        source: rootfiles
        target: /var/www/html

      #bind host directory
      - type: bind
        source: ./myfiles
        target: /var/www/html/myfiles
A shorter syntax can also be used to define <source>:<destination>. The <source> is presumed to be Docker volume unless it starts with . or .. relative file paths.

  mycontainer:

    #idential to above
    volumes:
      - rootfiles:/var/www/html
      - ./myfiles:/var/www/html/myfiles
Docker volumes (and optional configurations) must be referenced after the services: definition at the bottom of docker-compose.yml:

volumes:
  rootfiles:
📌 The containers you specify in your Compose file are under your services tag.

Set a custom dns server#
Define one or more DNS servers:

  mycontainer:
    dns:
      - 1.1.1.1
      - 8.8.8.8
expose ports#
Ports can be exposed to the host using “host:container” notation:

  mycontainer:
    expose:
      - "3000:3000"
Using a single container value, such as:

  mycontainer:
    expose:
      - "3000"
It only exposes the port to other containers on the same Docker network and not to the host this file is running on.

More than one port can be exposed for a container and even to a different port, e.g.,

  nodejs:
    expose:
      - "8000:3000"
      - "9229:9229"
The default port 3000 of the container or service nodejs is mapped on 8000 so now it’s available on 8000. Moreover, if you want to use devTools for Node.js debugging , you need to expose the 9229 port to 9229, which can be done by adding another port under the expose property.

# Define external_links to other containers
Containers started outside the current docker-compose.yml file can be referenced assuming they are on the same Docker network:

  mycontainer:
    external_links:
      - mysql
# Override the defaults
Override the Dockerfile CMD command using shell or exec (array) forms:

  mycontainer:
    command: node ./test.js
    #or [ "node", "./test.js" ]
Override the Dockerfile ENTRYPOINT command using shell or exec (array) forms:

  mycontainer:
    entrypoint: node ./test.js
    #or [ "node", "./test.js" ]
# Specify a restart policy
Restart policies include:

no: never restart the container (the default)
always: always restart the container when it stops
on-failure: restart the container when it fails with an exit code
  mycontainer:
    restart: on-failure
# Run a healthcheck
Configure a check that is run periodically to check a container is alive and responding:

  mycontainer:
    healthcheck:
      test: [ "CMD", "curl", "-f", "http://localhost:3000/test" ]
      interval: 1m00s
      timeout: 10s
      retries: 3
# Define a logging service
A log can be output using the driver of "json-file", "syslog", or "none":

  mycontainer:
    logging:
      driver: syslog
      options:
        syslog-address: "tcp://192.168.1.100:1234"
The option "none" does not display logs on the console. For both options, "syslog" and "json-file", the log-driver and log-opts keys need to be set with appropriate values in the daemon.json.