node {
    def commit_id

    stage('preparation') {
        checkout scm
        sh "git rev-parse --short HEAD > .git/commit-id"
        commit_id = readFile('.git/commit-id').trim()
    }

    stage('docker build/publish') {
        docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
            def app = docker.build("italoalmeida/jenkins:${commit_id}", '.').push()
        }
    }
}
