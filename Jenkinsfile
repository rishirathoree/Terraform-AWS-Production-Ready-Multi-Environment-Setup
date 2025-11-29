@Library('shared-groovy') _

pipeline{
    agent {label 'jenkins-dev-agent'}
    stages{
        stage('Build'){
            steps{
                sh docker build -t rishirathoree/react-app-new:latest -f dockerfiles/react.dockerfile .
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                }
                sh docker push rishirathoree/react-app-new:latest
            }
        }
    }
}

