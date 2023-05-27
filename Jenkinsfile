node {

  stage("GIT Checkout") {
    checkout scm
  }

  stage("declare the variables required for EKS switch") {
    script {
    catchError {
      dir('./') {
                acc_id = "${acc_id}"
                region = "${region}"
                }
              }
           }
  }

  stage("switch to the creator of cluster role") {
    catchError {
      sh "chmod +x switch-over.sh"
      sh "./switch-over.sh ${acc_id} eksadminrole ${region}"
    }
  }

  stage("check role is working or not") {
      sh "pwd"
      sh "cat .aws/credentials"
  }
}
