# Docker command cheat sheet

Command | Description
------- | -----------
`$ docker-compose up` | Use docker compose file to start docker containers
`$ docker-compose up -d` | Same but in detached mode
`$ docker-compose stop` | Stop containers but *without remove them*
`$ docker-compose down` | Stop containers and remove them
`$ docker-compose down -v` | Stop containers, remove them and also remove volumes
`$ docker volume prune` | Remove unused volumes
`$ docker volume create my-vol` | Create a single volumen with the given name.
`$ docker volume ls` | List current volumes
`$ docker volume inspect my-vol` | Display detailed information of the volume.
`$ docker logs some-mysql` | Show container logs.
`$ docker system prune -a` | Remove unused containers.
`$ docker exec -it <container-name> bash` | Opens a terminal inside 
`$ docker container exec -it <container-name> bash` | Opens a terminal inside the container (same as before but in the new syntax)