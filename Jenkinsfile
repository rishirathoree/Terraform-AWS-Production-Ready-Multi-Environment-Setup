@Library('shared-groovy') _

pipeline {
    agent { label 'jenkins-dev-agent' }

    environment {
        IMAGE_NAME = "rishirathoree/react-app-new"
        IMAGE_TAG = "latest"
        DOCKERFILE_PATH = "dockerfiles/react.dockerfile"
    }

    stages {
        stage('Build & Push Docker Image') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub',
                        usernameVariable: 'DOCKER_USERNAME',
                        passwordVariable: 'DOCKER_PASSWORD'
                    )
                ]) {
                    sh """
                        echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
                        docker build -t ${IMAGE_NAME}:${IMAGE_TAG} -f ${DOCKERFILE_PATH} .
                        docker push ${IMAGE_NAME}:${IMAGE_TAG}
                    """
                }
            }
        }
    }
}
