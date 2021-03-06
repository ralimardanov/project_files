pipeline {
  agent any
  triggers {
    githubPush()
  }

  stages {
    
    stage('Build') {
      steps {
        sh '''
        ./jenkins/build/mvn.sh mvn -B -DskipTests clean package
        ./jenkins/build/build.sh
        '''
      }
      post {
        success {
          archiveArtifacts artifacts: 'java-app/target/*.jar', fingerprint: true
        }
      }
    }
    
    stage('Test') {
      steps {
        sh './jenkins/test/mvn.sh mvn test'
      }
      post {
        always {
          junit 'java-app/target/surefire-reports/*.xml'
        }
      }
    }
    
    stage('Push') {
      steps {
        withCredentials([string(credentialsId: 'DOCKER_PASS', variable: 'DOCKER_PASS')]) {
          sh './jenkins/push/push.sh'
        }
      }
    }
    
    stage('Deploy') {
      steps {
        sh './jenkins/deploy/deploy.sh'
      }  
    }
  }
}
