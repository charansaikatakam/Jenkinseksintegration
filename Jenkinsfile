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
      sh "cat .aws/credentials"
  }

  stage("check the cluster accessibility"){
    catchError{
      sh "aws eks update-kubeconfig --name anythingformecluster --profile eksadminrole"
      sh "kubectl get pods -n kube-system"
    }
  }

  stage("deploy the helm") {
    dir("Helmcharts\nginxhelm")
    sh "helm install nginxhelm ./"
  }
}
