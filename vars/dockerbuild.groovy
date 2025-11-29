def call(String imageName,String tag, String userName, String filePath) {
    sh "docker build -t ${imageName}:${tag} -f ${filePath} ."
}