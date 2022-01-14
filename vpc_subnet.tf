resource "aws_vpc" "latam" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "VPC LATAM"
    Location = "US"
  }
}

resource "aws_subnet" "subnet_1" {
  vpc_id = aws_vpc.latam.id
  availability_zone = var.availability_zone_subnet_1
  cidr_block = var.cidr_subnet_1
  tags = {
    Name = "Subnet-1"
  }
}

resource "aws_subnet" "subnet_2" {
  vpc_id = aws_vpc.latam.id
  availability_zone = var.availability_zone_subnet_1
  cidr_block = var.cidr_subnet_2
  tags = {
    Name = "Subnet-2"
  }
}

resource "aws_subnet" "subnet_3" {
  vpc_id = aws_vpc.latam.id
  availability_zone = var.availability_zone_subnet_1
  cidr_block = var.cidr_subnet_3
  tags = {
    Name = "Subnet-3"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.latam.id
  tags = {
    Name = "Internet GW VPC Latam"
  }
}

resource "aws_route_table" "web_public" {
  vpc_id = aws_vpc.latam.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Public route for web applications "
  }
}

resource "aws_route_table_association" "public_subnet_1" {
  subnet_id = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.web_public.id
}

resource "aws_route_table_association" "public_subnet_2" {
  subnet_id = aws_subnet.subnet_2.id
  route_table_id = aws_route_table.web_public.id
}

resource "aws_route_table_association" "public_subnet_3" {
  subnet_id = aws_subnet.subnet_3.id
  route_table_id = aws_route_table.web_public.id
}