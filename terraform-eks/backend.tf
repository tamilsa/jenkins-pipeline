terraform {
  backend "s3" {
    bucket = "jensins-kubernetes-app"
    region = "us-east-2"
    key = "eks/terraform.tfstate"
  }
}
