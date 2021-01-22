#!/bin/bash
# this will build app inside container, save cache to /root/.m2/ on VM and remove container

echo "***** Building jar *****"
WORKSPACE=/home/jenkins/jenkins_data/jenkins_home/workspace/pipeline-maven-project

docker run --rm -v $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine "$@"
