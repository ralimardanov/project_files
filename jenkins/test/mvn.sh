#!/bin/bash
# this will test the builded app

echo "***** Testing the code *****"

WORKSPACE=/home/jenkins/jenkins_data/jenkins_home/workspace/pipeline-maven-project

docker run --rm -v $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine "$@"
