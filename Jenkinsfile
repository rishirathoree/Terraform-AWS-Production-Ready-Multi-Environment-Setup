@Library('shared-groovy') _

pipeline {
    agent { label 'jenkins-dev-agent' }
    stages {
        stage('Build & Push Docker Image') {
            steps {
                script{
                    dockerbuild('rishirathoree/react-app-new','latest','rishirathoree','dockerfiles/react.dockerfile')
                }
            }
        }
    }
}
