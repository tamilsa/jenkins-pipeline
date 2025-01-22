terraform {
  backend "s3" {
    bucket = "jenkins-kubernetes-infra"
    region = "ap-south-1"
    key = "eks/terraform.tfstate"
  }
}
