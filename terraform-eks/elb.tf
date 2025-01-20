resource "aws_subnet" "lb_subnet" {
  vpc_id                  = "vpc-xxxxxx"  # VPC ID
  cidr_block              = "10.0.1.0/24"  # CIDR block for subnet
  availability_zone       = "us-west-2a"    # Availability Zone

  tags = {
    Name                        = "lb-subnet"
    "kubernetes.io/role/elb"    = "1"  # Tag to enable Classic Load Balancer
    "kubernetes.io/cluster/eks-cluster" = "shared"  # Specify Kubernetes cluster
  }
}
resource "aws_security_group" "lb_sg" {
  vpc_id = "module.demo-vpc.vpc_id"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_lb" "classic_lb" {
  name               = "classic-lb"
  internal           = false
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [aws_subnet.lb_subnet.id]

  enable_deletion_protection = false

  tags = {
    Name = "classic-lb"
  }
}
