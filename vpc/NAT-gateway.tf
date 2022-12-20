# NAT GATEWAY

resource "aws_nat_gateway" "ng1" {
  allocation_id = aws_eip.nat1.id
  subnet_id     = aws_subnet.public_1.id

  tags = {
    Name = "NAT 1"
  }
}

resource "aws_nat_gateway" "ng2" {
  allocation_id = aws_eip.nat2.id
  subnet_id     = aws_subnet.public_2.id

  tags = {
    Name = "NAT 1"
  }
}