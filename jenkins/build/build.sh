#!/bin/bash

echo "***** Copy jar file *****"
cp -f java-app/target/*.jar jenkins/build/

echo "***** Build Docker image *****"
cd jenkins/build/ && docker-compose -f docker-compose-build.yml build --no-cache
