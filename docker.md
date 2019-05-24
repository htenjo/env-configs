# Docker command cheat sheet

Command | Description
------- | -----------
`$ docker-compose up` | Use docker compose file to start docker containers
`$ docker-compose up -d` | Same but in detached mode
`$ docker-compose down` | Stop containers from compose file
`$ docker-compose stop` | 
`$ docker system prune -a` | Remove unused containers
`$ docker volume prune` | Remove unused volumes
`$ docker volume create my-vol` | 	
`$ docker volume ls` | 	
`$ docker volume inspect my-vol` | 
`$ docker logs some-mysql` | 
`$ docker exec -it <container-name> bash` | Opens a terminal inside the container