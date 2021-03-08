node {
   stage('docker build/push') {            
     docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
       def app = docker.build("italoalmeida/jenkins:latest", '.').push()
     }                                     
   }                                       
}
