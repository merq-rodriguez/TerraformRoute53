resource "aws_route53_zone" "dev" {
  name = var.route53_zone
  force_destroy = false

  vpc {
    vpc_id = aws_vpc.latam.id
  }
}
