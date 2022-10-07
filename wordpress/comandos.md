# Ver la ip  del container
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' wordpress

# Develop a new  theme
cp -r /usercode/wordpress/docker-basic /usercode/wordpress/wp-content/themes/

# notas:
En ese  caso la app se econtraba en el puerto  80 mientras que el dashboard de wp estaba en la ruta /wp-admin