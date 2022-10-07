# Dockerfile Explanation
Starting with the FROM node:lts-alpine base image, each line defines a step to install and run the Node.js application in production mode.

To define the environment variables, we use the command ENV.

The HOME variable sets the path inside the container where we want our files to be installed e.g., /home/node/app.
The NODE_ENV variable sets the environment to production.
The NODE_PORT variable sets the port to 3000.
The command WORKDIR is used to define the working directory of a Docker container at any given time. All next commands after it will be executed in the specified working directory.

The command USER sets the active user node.

The COPY allows us to copy our relevant files to the working directory. We have copied it using our active user.

The RUN allows us to execute the commands. Here we are installing our required app modules. We can also use this command to change directories.

The command EXPOSE allows the port to be exposed to the host. We have set it to 3000.

The CMD defines the default command to run when a container is started from the image. We have used the Exec form.

# .dockerignore
The COPY . . command copies all application files from the host directory to the Docker image. It’s unlikely you’ll need everything, so a .dockerignore file can be defined to omit files or directories that match name patterns. It will be familiar to anyone who has used Git’s .gitignore file:
