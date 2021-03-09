node {
    def image = "italoalmeida/jenkins"
    def tag = "latest"

    stage('Preparation') {
        checkout scm
    }

    stage('Build and publish Docker image') {
        docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
            def app = docker.build("${image}:${tag}", '.').push()
        }
    }
    
    stage('Remove unused docker image') {
        sh "docker rmi ${image}:${tag}"
    }
}
