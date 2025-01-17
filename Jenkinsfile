pipeline {
    agent any
    parameters {
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Choose the Terraform action to perform')
    }
    environment {
       // # Jenkins will use the credentials added earlier
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-east-2"
    }
    stages {
       // # Stage 1
        stage("Create an EKS Cluster") {
            steps {
                script {
                    dir('terraform-eks') {
                      //  # Jenkins will run these commands for us
                        sh "terraform init"
                        sh "terraform ${params.ACTION} -auto-approve"
                    }
                }
            }
        }
      //  # Stage 2
//#        stage("Deploy to EKS") {
//#            steps {
//#                script {
//#                    dir('kubernetes') {
//#                        # Update packages inside the cluster
//#                        sh "aws eks update-kubeconfig --name eks-cluster"
//#                        # Deploy an application
//#                        sh "kubectl apply -f nginx-deployment.yaml"
//#                        # Deploy a service
//#                        sh "kubectl apply -f nginx-service.yaml"
//#                    }
//#                }
//#            }
//#        }
    }

}
