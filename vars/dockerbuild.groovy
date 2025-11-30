def call(String imageName,String tag, String userName, String filePath) {
    withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
        sh "docker login -u $USERNAME -p $PASSWORD"
    }
    sh "docker build -t ${imageName}:${tag} -f ${filePath} ."
    sh "docker push ${userName}/${imageName}:${tag}"
}