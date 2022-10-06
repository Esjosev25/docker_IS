# Iniciar docker compose
docker-compose up

# Iniciar docker compose con otro nombre
This specifies a level of compatibility. The -f option allows you to specify an alternative configuration filename, e.g. <br>
**docker-compose -f ./my-config.yml up**

# Iniciar docker as background service
Docker Compose can be run as a background service or in detached mode using -d. This may be practical on a live server where foreground logging is not required: <br>
**docker-compose up -d**

## Ver contenedores activos
docker-compose ps

## Detener los contenedores
docker-compose down