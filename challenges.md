# Running a postgress Database
docker run -it --rm --name postgres  -p 3000:5432 --mount "src=postgresdata,target=/var/lib/postgresql/data"  -e POSTGRES_PASSWORD=mysecret  postgres

## Running a mongodb database
docker run -it --rm --name mongodb -p 3000:27017 --mount "src=mongodata,target=/data/db"  -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=mysecret mongo


