node {
    def registry = "italoalmeida/jenkins"
    def commit_id

    stage('Preparation') {
        checkout scm
        sh "git rev-parse --short HEAD > .git/commit-id"
        commit_id = readFile('.git/commit-id').trim()
    }

    stage('Build and publish Docker image') {
        docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
            def app = docker.build("${registry}:${commit_id}", '.').push()
        }
    }
    
    stage('Remove unused docker image') {
        sh "docker rmi ${registry}:${commit_id}"
    }
}
