# PUBLIC SUBNET

resource "aws_subnet" "public_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.0.0/18"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-ap-south-1a"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb" = 1
  }
}

resource "aws_subnet" "public_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.64.0/18"
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-ap-south-1b"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb" = 1
  }
}