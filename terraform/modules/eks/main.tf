variable "vpc_id"          {}
variable "private_subnets" {}

resource "aws_eks_cluster" "production_mesh" {
  name     = "core-aegis-production-mesh"
  role_arn = aws_iam_role.cluster_role.arn

  vpc_config {
    subnet_ids = var.private_subnets
  }
}

resource "aws_iam_role" "cluster_role" {
  name = "core-aegis-eks-cluster-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = { Service = "://amazonaws.com" }
    }]
  })
}
