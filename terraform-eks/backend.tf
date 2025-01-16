terraform {
  backend "s3" {
    bucket = "jensins-kubernetes-app-2024-v2"
    region = "us-east-2"
    key = "eks/terraform.tfstate"
  }
}
