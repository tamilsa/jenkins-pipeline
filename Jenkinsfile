pipeline {
    agent any
    parameters {
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Choose the Terraform action to perform')
    }
    environment {
       // # Jenkins will use the credentials added earlier
        //AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        //AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "ap-south-1"
    }
    stages {
        stage("Terraform Init and Apply/Destroy") {
            steps {
                script {
                    dir('terraform-eks') {
                        // Initialize Terraform
                        sh "terraform init"
                        echo "Running terraform validate..."
                        sh "terraform validate"
                        // Perform the action selected in the parameter
                        if (params.ACTION == 'apply') {
                            echo "Running terraform apply..."
                            sh "terraform apply -auto-approve"
                        } else if (params.ACTION == 'destroy') {
                            echo "Running terraform destroy..."
                            sh "terraform destroy -auto-approve"
                        }
                    }
                }
            }
        }
    }
}

