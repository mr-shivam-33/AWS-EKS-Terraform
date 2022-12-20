# EKS-CLUSTER

resource "aws_eks_cluster" "eks-blokchi" {
  name     = "eks-blokchi"
  role_arn = aws_iam_role.eks_cluster.arn

  version = "1.21"

  vpc_config {

    # endpoint_private_access = false
    # endpoint_public_access  = true

    subnet_ids = [
      aws_subnet.public_1.id,
      aws_subnet.public_2.id,
      aws_subnet.private_1.id,
      aws_subnet.private_2.id
    ]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.Amazon_EKS_Cluster_Policy
  ]
}