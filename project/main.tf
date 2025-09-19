provider "aws" {
    region = "ca-central-1"
    access_key = "access_key"
    secret_key = "secret_key"
}

# Create new VPC
resource "aws_vpc" "A" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Developer25"
  }
}

# Create internet gateway
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.A.id

  tags = {
    Name = "DevIGW"
  }
}

# Create route table
resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.A.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }
  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.IGW.id
  }

  tags = {
    Name = "DevRT"
  }
}

# Create subnet
resource "aws_subnet" "dev_subnet" {
  vpc_id                  = aws_vpc.A.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ca-central-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "dev_subnet"
  }
}

# Associate subnet with route table
resource "aws_route_table_association" "RT1" {
  subnet_id      = aws_subnet.dev_subnet.id
  route_table_id = aws_route_table.RT.id
}

# Create security group
resource "aws_security_group" "SG" {
  name        = "SG"
  description = "Allow SSH, HTTP, HTTPS"
  vpc_id      = aws_vpc.A.id

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Custom_SG"
  }
}

# Create ENI
resource "aws_network_interface" "ENI_A" {
  subnet_id       = aws_subnet.dev_subnet.id
  private_ips     = ["10.0.0.10"]
  security_groups = [aws_security_group.SG.id]
}

# Create Elastic IP
resource "aws_eip" "EPI_A" {
  vpc                       = true
  network_interface         = aws_network_interface.ENI_A.id
  associate_with_private_ip = "10.0.0.10"

  tags = {
    Name = "EIP_A"
  }
}
