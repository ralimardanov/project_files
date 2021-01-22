#!/bin/bash

DOCKER_PASS=$(aws ssm get-parameter --name "PASS" --region us-east-1 --query Parameter.Value --output text)
PROJECT_NAME=$(aws ssm get-parameter --name "PROJECT_NAME" --region us-east-1 --query Parameter.Value --output text)
USERNAME=ralimardanov
DIR_NAME=/home/jenkins/maven
FILE_NAME=/home/jenkins/maven/docker-compose.yml

# Use this if you have variables defined in AWS SSM Parameter store. For pipeline, variables were defined in Jenkins.
#BUILD_TAG=$(aws ssm get-parameter --name "BUILD_TAG" --region us-east-1 --query Parameter.Value --output text)

if [ -d "$DIR_NAME" ]; then
  echo "$DIR_NAME Exists"
else
  mkdir $DIR_NAME
  echo "Created $DIR_NAME"
fi

echo "Recreating docker-compose.yml file"
cat >$FILE_NAME<<-EOF
version: '3'
services:
  maven:
    image: "$USERNAME/$PROJECT_NAME:$BUILD_TAG"
    container_name: maven-app
EOF

echo "Login to Docker hub"
docker login -u $USERNAME -p $DOCKER_PASS
echo "Docker-compose up is running"
cd $DIR_NAME && docker-compose up -d
