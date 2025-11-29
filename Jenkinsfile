@Library('shared-groovy') _

pipeline{
    agent {label 'jenkins-dev-agent'}
    stages{
        stage("checking"){
            steps{
                script{
                    sayHello()
                }
            }
        }
    }
}