# Build an image from a Dockerfile
docker image build -t <image_name> .
Assuming a Dockerfile is in the current directory:

docker image build -t myimage .
The option -t allows you to tag the image. In this case, the image named myimage is tagged latest as no tag was specified. The tag can be specified as:

docker image build -t myimage:first .
The period at the end of the command is essential. It references the application path. You can also use -f <file> if you didn’t name your build file “Dockerfile”, e.g., if an alternative file name was used:

docker image build -f mybuildfile.txt -t myimage .
# Tag a built image
docker tag <image_name> [user/repository:tag]
Example: tag the myimage image with first in the Docker Hub myrepository repository and the username is myname:

docker tag myimage myname/myrepository:first

# Push tagged images to Docker Hub
docker push [user/repository]
Example:

docker push  myname/myrepository
You can also push with tag:

docker push  myname/myrepository:first

# List Docker images
docker image ls
docker images
View all images, both active and dangling:

docker image ls -a