# SparkDocker
This can be used to deploy a single node Spark Cluster using Docker Compose.
## Getting Started 
Following steps will guide you how to deploy this on your host.
### Prerequsites 
Docker version 18.09.0 or higher on your host machine. (In lower versions also this may work but haven't tested)
Docker-Compose version 1.23.1 (docker-compose.yml is written in docker compose file version 1)
Check [Docker-Compose](https://docs.docker.com/compose/compose-file/) for refference. 
### Installing
Using the docker file you can build a docker image including Apache Spark version 2.2.0 (You can change it on your requirement). 
Usiing Docker-compose you can deploy multiple docker containers as a spark standalone cluster. In the docker-compose.yml here it has 
one master and a one worker. 
Also do make the necessary changes under ``volumes`` tag to attach volumes to containers.
### Deployment 
To start Apache Spark Standalon cluster 
``` docker-compose up ```
Command should be executed from folder in which docker-compose.yml file is located.
Make sure you don't have any applications binded to ports which mapped in yaml file on your host machine.
Voila :sparkles: You have spark standalone cluster on docker now. :+1:

