#!/bin/bash

# Get the ID of the Jenkins container
container_id=$(docker ps -f name=jenkins --format "{{.ID}}")

# Get the initial administrator password from the Jenkins log
jenkins_password=$(docker exec $container_id cat /var/jenkins_home/secrets/initialAdminPassword)
echo "Jenkins initial administrator password: $jenkins_password"
