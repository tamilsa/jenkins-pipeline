terraform {
  backend "s3" {
    bucket = "jenkins-kubernetes-app"
    region = "us-east-2"
    key = "eks/terraform.tfstate"
  }
}
