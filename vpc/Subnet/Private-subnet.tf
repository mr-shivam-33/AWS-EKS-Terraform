# PRIVATE SUBNET

resource "aws_subnet" "private_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.128.0/18"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "private-ap-south-1a"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}

resource "aws_subnet" "private_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.192.0/18"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "private-ap-south-1b"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}