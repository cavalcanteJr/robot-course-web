pipeline {
   agent {
       docker{
           image "qaninja/pyrobot2"
       }
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
          steps{
              input (message: "Go to production?", ok: "Partiu")
              echo "simulando a subida em produção!!!"
          }
      }
      stage("Prod"){
          steps{
              echo "produção ok"
          }
      }
}