Dockerfiles, Jenkinsfiles and etc for terraform project.

Variables like PASS in jenkins/push/push.sh, BUILD_TAG(this is default in jenkins) should be exported.
For manual deploy purposes (publish.sh script in jenkins/deploy folder) I've created variables in AWS SSM Parameter store.
For this to work, you should have role with access to AWS SSM attached to EC2 instance.

For test, I'm creating second EC2 to which I deploy manually, that's why I have to change IP in jenkins/deploy/deploy.sh script manually.

For Jenkins pipeline implementation, DOCKER_PASS was defined as Secret Text credential, PROJECT_NAME variable was defined as global ENV.

PS: thanks ricardoandre97 for your cource and jenkins-resources repo.
