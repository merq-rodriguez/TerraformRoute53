resource "aws_instance" "server1" {
  ami = var.ec2_ami
  instance_type = var.ec2_instance_type
  
  subnet_id = aws_subnet.subnet_1.id
  vpc_security_group_ids = [aws_security_group.sg_route_allow_http_ssh.id]
  associate_public_ip_address = true
  private_ip = var.private_ip_server_1

  key_name = aws_key_pair.deployer.key_name
  depends_on = [
    aws_internet_gateway.gw
  ]

  user_data = file("user_data.sh")

  tags = {
    Name = "Server 1"
    Environment = var.environment
  }
}

resource "aws_instance" "server2" {
  ami = var.ec2_ami
  instance_type = var.ec2_instance_type
  
  subnet_id = aws_subnet.subnet_1.id
  vpc_security_group_ids = [aws_security_group.sg_route_allow_http_ssh.id]
  associate_public_ip_address = true
  private_ip = var.private_ip_server_2

  key_name = aws_key_pair.deployer.key_name
  depends_on = [
    aws_internet_gateway.gw
  ]

  user_data = file("user_data.sh")

  tags = {
    Name = "Server 2"
    Environment = var.environment
  }
}