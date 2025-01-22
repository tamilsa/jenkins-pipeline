terraform {
  backend "s3" {
    bucket = "jenkins-kubernetes-app"
    region = "ap-south-1"
    key = "eks/terraform.tfstate"
  }
}
