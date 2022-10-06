
# Instanciar mysql latest
docker run -it --rm --name mysql  -p 3306:3306 --mount "src=mysqldata,target=/var/lib/mysql"  -e MYSQL_ROOT_PASSWORD=mysecret  mysql
## Con una subred mysqlnet
docker run -d --rm --name mysql -p 3306:3306 --mount "src=mysqldata,target=/var/lib/mysql" -e MYSQL_ROOT_PASSWORD=mysecret --net mysqlnet mysql
## Crear un backup 
docker exec mysql /usr/bin/mysqldump -u root -p <password> mydb > backup.sql

# Instanciar Adminer
## Con una subred mysqlnet
docker run -d --rm --name adminer -p 8080:8080 --net mysqlnet adminer
