# Useful docker commands

## Docker command cheat sheet

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
`$ docker exec -it <container-name> bash` | Opens a terminal from the container 
`$ docker container exec -it <container-name> bash` | Opens a terminal inside the container

## General command
| Description                           | Command                                      |
| ------------------------------------- | -------------------------------------------- |
| Open a bash terminal in the container | `$ docker exec -it <CONTAINER_ID> /bin/bash` |

## MySQL
| Description                                                  | Command                                                                                                                    |
| ------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------- |
| Download MySQL the image                                     | `$ docker pull mysql:latest`                                                                                               |
| Create a container with some default params                  | `$ docker container create --name mysql_name -e MYSQL_ROOT_PASSWORD=000000 -e MYSQL_DATABASE=mydb_name -p 3306:3306 mysql` |
| Start the container                                          | `$ docker container start mysql_name`                                                                                      |
| Start the container AND keep logs attached (in bash console) | `$ docker container start mysql_name | docker logs -f mysql_name`                                                          |

### Known issues
| Error Description             | How to solve it?                                                                                   |
| ----------------------------- | -------------------------------------------------------------------------------------------------- |
| Public key can't be retrieved | You need to configure the connection string adding `useSSL=false AND allowPublicKeyRetrieval=true` |


## Couchbase

After installed, you can login in Couchbase through 
GET http://localhost:8091 (user: 'Administrator' y pass: 'password')

| Description                | Command                                                                           |
| -------------------------- | --------------------------------------------------------------------------------- |
| Download couchbase image   | `$ docker pull couchbase`                                                         |
| Download and run couchbase | `$ docker run -d --name my-couch -p 8091-8094:8091-8094 -p 11210:11210 couchbase` |

# PostgreSQL
| Description               | Command                                                                                      |
| ------------------------- | -------------------------------------------------------------------------------------------- |
| Download Postgres         | `$ docker pull Postgres`                                                                     |
| Download and run postgres | `$ docker run --name postgres-tamiz -e POSTGRES_PASSWORD=123456789 -p 5432:5432 -d postgres` |


## Jenkins
| Description              | Command                                                        |
| ------------------------ | -------------------------------------------------------------- |
| Download and run Jenkins | `$ docker run -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts` |

## Minio

| Description             | Command                                                                                                                          |
| ----------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| Download and run Min.io | `$ docker run -p 9000:9000 minio/minio server /data`                                                                             |
| Run configured          | `docker run -p 9000:9000 --name minio_bk -e "MINIO_ACCESS_KEY=USERNAME" -e "MINIO_SECRET_KEY=PASSWORD" minio/minio server /data` |
