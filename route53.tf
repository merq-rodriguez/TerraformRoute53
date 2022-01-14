resource "aws_route53_zone" "dev" {
  name = var.route53_zone
  force_destroy = false

  vpc {
    vpc_id = aws_vpc.latam.id
  }

  tags = {
    Environment = var.environment
  }
}

resource "aws_route53_record" "server1" {
  zone_id = aws_route53_zone.dev.id
  name = "server1.${aws_route53_zone.dev.name}"
  type = "A"
  ttl = "300"
  records = [aws_instance.server1.private_ip]
}

resource "aws_route53_record" "server2" {
  zone_id = aws_route53_zone.dev.id
  name = "server2.${aws_route53_zone.dev.name}"
  type = "A"
  ttl = "300"
  records = [aws_instance.server2.private_ip]
}