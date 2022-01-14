variable "aws_region" {
  type = string
  description = "Region AWS"
}

variable "ec2_ami" {
  type = string
  description = "Ami for instance EC2"
}

variable "ec2_instance_type" {
  type = string
  description = "Instance type ec2"
}

variable "vpc_cidr" {
  type = string
}

variable "availability_zone_subnet_1" {
  type = string
  description = "Availability zone for subnet 1"
}

variable "availability_zone_subnet_2" {
  type = string
  description = "Availability zone for subnet 2"
}

variable "availability_zone_subnet_3" {
  type = string
  description = "Availability zone for subnet 3"
}

variable  "cidr_subnet_1" {
  type = string
  description = "CIDR - Subnet 1"
}

variable  "cidr_subnet_2" {
  type = string
  description = "CIDR - Subnet 2"
}

variable  "cidr_subnet_3" {
  type = string
  description = "CIDR - Subnet 3"
}

variable "private_ip_server_1" {
  type = string
}

variable "private_ip_server_2" {
  type = string
}

variable "route53_zone" {
  type = string
}