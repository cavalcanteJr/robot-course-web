pipeline {
   agent {
       docker{
           image "python:3.5.1"
       }
   stages {
      stage('Setup') {
         steps {
            sh "pip install -r requirements.txt"
         }
      }
      stage("Test"){
          steps{
              sh "robot -d ./logs tests"
          }
          post {
              always {
                robot "logs"
              }
          }
      }
      stage("UAT"){
          step{
              input (message: "Go to production?", ok: "Partiu")
              echo "simulando a subida em produção!!!"
          }
      }
      stage("Prod"){
          stage{
              echo "produção ok"
          }
      }
   }
}