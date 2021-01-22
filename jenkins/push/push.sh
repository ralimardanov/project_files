#!/bin/bash

echo "****** Docker login ******"
docker login -u ralimardanov -p $DOCKER_PASS

echo "***** Tag image *****"
docker tag $PROJECT_NAME:$BUILD_TAG ralimardanov/$PROJECT_NAME:$BUILD_TAG

echo "***** Push image ******"
docker push ralimardanov/$PROJECT_NAME:$BUILD_TAG
