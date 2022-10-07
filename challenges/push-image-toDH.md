1. Build and tag an image
docker image build -t <EstuardoV25>/challenge:try .
2. List down all images:
docker image build -f Dockerfile.prod -t <EstuardoV25>/challenge:try .
3. Push my image to the repository
docker push <EstuardoV25>/challenge
4. Run the container
docker run -it --rm --name nodecontainer -p 8080:3000 \
<EstuardoV25>/challenge:try