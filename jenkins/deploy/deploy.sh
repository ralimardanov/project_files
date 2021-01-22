#!/bin/bash

scp -i ~/id_rsa ./jenkins/deploy/publish.sh jenkins@172.32.40.156:/tmp/publish.sh
ssh -i ~/id_rsa jenkins@172.32.40.156 "BUILD_TAG=$BUILD_TAG /tmp/publish.sh"
