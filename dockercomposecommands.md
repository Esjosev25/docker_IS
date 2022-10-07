# Docker Compose CLI#
Docker Compose commands can be used in the same directory as your docker-compose.yml configuration file. Let’s have a look at some of the most commonly used commands.

Launch all containers:

docker-compose up
Images can be rebuilt with:

docker-compose up --build
You can also build it first and then launch it:

docker-compose build
docker-compose up
Specify an alternative directory and/or filename:

docker-compose -f ./my-config.yml up
-f is necessary for the commands below if you are running docker-compose from a directory other than where the configuration YML file is stored.

Start as background service:

docker-compose up -d
View active containers:

docker-compose ps
View container logs:

docker-compose logs
Pause running containers with:

docker-compose pause
Then resume with:

docker-compose unpause
Restart all stopped and running containers:

docker-compose restart
Stop containers without removing them:

docker-compose stop
Start stopped containers:

docker-compose start
Remove stopped containers:

docker-compose rm
Stop and remove running containers, images, volumes, and networks:

docker-compose down