module "eks" {
    source  = "terraform-aws-modules/eks/aws"
    version = "~> 19.0"
    cluster_name = "eks-cluster"
    cluster_version = "1.30"
    cluster_endpoint_public_access  = true
    vpc_id = module.demo-vpc.vpc_id
    subnet_ids = module.demo-vpc.private_subnets
    tags = {
        environment = "development"
        application = "myapp"
    }
    eks_managed_node_groups = {
        dev = {
            min_size = 1
            max_size = 3
            desired_size = 2
            instance_types = ["t2.small"]
        }
    }
}

resource "aws_ecr_repository" "demo_ecr_repo" {
  name                 = "demo-ecr-repo"
  image_tag_mutability = "MUTABLE"  # or "IMMUTABLE" based on your requirement
  image_scanning_configuration {
    scan_on_push = true
  }
}
