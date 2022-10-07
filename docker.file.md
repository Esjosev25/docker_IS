# Dockerfile#
A Dockerfile is a plain-text file describing the steps to build an image, typically for your own application. To build a Docker image from a Dockerfile in the current directory, enter:

docker image build -t <image_name> .
The period at the end of the command references the current directory. Append -f <file> to use an alternative path or file name.

The commands below will be used most often.

# # comment#
# Lines beginning with # denote a comment:

# #my comment
# ARG arguments#
Variables can be passed at build time with the --build-arg <name>=<value> option. The value is imported with an ARG statement:

# #get myvar
ARG myvar
A default value can be defined when nothing is passed:

# #get myvar, with default of "myimage"
ARG myvar=myimage
Use its value elsewhere by prepending a $ symbol:

RUN echo $myvar
Where the value must be set in part of a string, a ${name} substitution can be defined:

FROM ${myvar}:latest
# ENV environment variables#
Set an environment variable:

ENV HOME=/home/app
Use its value elsewhere by prepending $ symbol or ${} container:

RUN echo $HOME
RUN echo ${HOME}
# FROM <image> starting image#
Create a new image using an existing image as a starting point. This will usually be the first command in a Dockerfile:

# #latest Node LTS on Alpine Linux
FROM node:lts-alpine
# WORKDIR working directory#
Set the working directory for any following COPY, ADD, RUN, CMD and ENTRYPOINT instructions:

WORKDIR /home/myapp
# COPY files from the host to an image#
Using file patterns:

# #copy all files to current folder
COPY . .

# #copy all txt files to /doc/ folder
COPY *.txt /doc/

# #copy all files and assign ownership to a user and group
# #(Linux containers only)
COPY --chown=myuser:mygroup . .
# ADD files#
ADD is similar to COPY, but it also supports using URLs and tar files as the source. This may be useful, although using a RUN with chained curl and tar commands will create a smaller Docker image with fewer layers.

# Mount a VOLUME#
By creating a mount point we can make files and folders accessible to other containers, e.g., in the following the data in the folder /data/myvol is available to other containers in the network too,

RUN mkdir -p /data/myvol
VOLUME /data/myvol
Multiple volumes or mount points can be specified as:

VOLUME /myvol1 /myvol2 /myvol3
Example use: If you are serving a Node.js application to NGINX and you want to share some Node.js files with NGINX, you can mount the client-side HTML, CSS, JavaScript, and media files in a static folder on a Node.js container. Now these files can be served directly by an NGINX web server running in another container.

# Set a USER#
Define the user (and optionally a group) to use for RUN, CMD and ENTRYPOINT instructions:

USER myuser
# RUN a command#
RUN issues instructions during the build, such as installation or configuration commands. Any number is permitted in the Dockerfile.

Execute commands using shell form:

RUN npm install
Or an exec (array) form to run an executable directly, which is the recommended option:

RUN ["npm", "install"]

# Dockerfile#
A Dockerfile is a plain-text file describing the steps to build an image, typically for your own application. To build a Docker image from a Dockerfile in the current directory, enter:

docker image build -t <image_name> .
The period at the end of the command references the current directory. Append -f <file> to use an alternative path or file name.

The commands below will be used most often.

# # comment#
# Lines beginning with # denote a comment:

# #my comment
# ARG arguments#
Variables can be passed at build time with the --build-arg <name>=<value> option. The value is imported with an ARG statement:

# #get myvar
ARG myvar
A default value can be defined when nothing is passed:

# #get myvar, with default of "myimage"
ARG myvar=myimage
Use its value elsewhere by prepending a $ symbol:

RUN echo $myvar
Where the value must be set in part of a string, a ${name} substitution can be defined:

FROM ${myvar}:latest
# ENV environment variables#
Set an environment variable:

ENV HOME=/home/app
Use its value elsewhere by prepending $ symbol or ${} container:

RUN echo $HOME
RUN echo ${HOME}
# FROM <image> starting image#
Create a new image using an existing image as a starting point. This will usually be the first command in a Dockerfile:

# #latest Node LTS on Alpine Linux
FROM node:lts-alpine
# WORKDIR working directory#
Set the working directory for any following COPY, ADD, RUN, CMD and ENTRYPOINT instructions:

WORKDIR /home/myapp
# COPY files from the host to an image#
Using file patterns:

# #copy all files to current folder
COPY . .

# #copy all txt files to /doc/ folder
COPY *.txt /doc/

# #copy all files and assign ownership to a user and group
# #(Linux containers only)
COPY --chown=myuser:mygroup . .
# ADD files#
ADD is similar to COPY, but it also supports using URLs and tar files as the source. This may be useful, although using a RUN with chained curl and tar commands will create a smaller Docker image with fewer layers.

# Mount a VOLUME#
By creating a mount point we can make files and folders accessible to other containers, e.g., in the following the data in the folder /data/myvol is available to other containers in the network too,

RUN mkdir -p /data/myvol
VOLUME /data/myvol
Multiple volumes or mount points can be specified as:

VOLUME /myvol1 /myvol2 /myvol3
Example use: If you are serving a Node.js application to NGINX and you want to share some Node.js files with NGINX, you can mount the client-side HTML, CSS, JavaScript, and media files in a static folder on a Node.js container. Now these files can be served directly by an NGINX web server running in another container.

# Set a USER#
Define the user (and optionally a group) to use for RUN, CMD and ENTRYPOINT instructions:

USER myuser
# RUN a command#
RUN issues instructions during the build, such as installation or configuration commands. Any number is permitted in the Dockerfile.

Execute commands using shell form:

RUN npm install
Or an exec (array) form to run an executable directly, which is the recommended option:

RUN ["npm", "install"]
# .dockerignore file patterns#
.docekerignore specifies filename patterns to omit when using COPY and ADD. For example:
Dockerfile
docker*.yml

.git
.gitignore
.config

.npm
.vscode
node_modules

README.md