# WORKER NODE

resource "aws_eks_node_group" "nodes_general" {
  cluster_name    = aws_eks_cluster.eks-blokchi.name
  node_group_name = "private-nodes"
  node_role_arn   = aws_iam_role.nodes_general.arn
  subnet_ids      = [
    aws_subnet.private_1.id,
    aws_subnet.private_2.id
  ]

  scaling_config {
    desired_size = 2
    max_size     = 4
    min_size     = 2
  }

  ami_type = "AL2_x86_64"
  capacity_type = "ON_DEMAND"
  disk_size = 20

  force_update_version = false

  instance_types = ["t3.small"]

  labels = {
    role = "nodes-general"
  }

  version = "1.21"

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
}
