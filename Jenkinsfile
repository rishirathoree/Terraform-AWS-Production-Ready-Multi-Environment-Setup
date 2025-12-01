@Library('shared-groovy') _

pipeline {
    agent { label 'jenkins-dev-agent' }
    stages {
        stage('Build & Push Docker Image') {
            steps {
                script{
                    dockerbuild('react-app-new','latest','rishirathoree','dockerfiles/react.dockerfile')
                }
            }
        }
        stage('Deploy') {
            steps {
                script{
                    deploy()
                }
            }
        }
    }
}

