# Log into docker cli
docker login
<!-- To log in to an alternative image repository (not Docker Hub), use: -->
docker login <url>
## Build an application image
docker image build -t nodehello .

## test the image by launching a container
docker run -d --rm --name nodehello -p 3000:3000 nodehello

# tag and image
docker tag nodehello craigbuckler/nodehello:firsttry
<!-- tagged version points to the nodehello original -->
docker tag nodehello craigbuckler/nodehello:latest

# push into docker hub
docker push craigbuckler/nodehello

# url image
https://hub.docker.com/repository/docker/[your_user_name]/[image_name]/