resource "aws_elb" "elb_latam" {
  name = "elblatam"
  security_groups = [ aws_security_group.sg_elb_latam.id]
  subnets = [
    aws_subnet.subnet_1.id, 
    aws_subnet.subnet_2.id, 
    aws_subnet.subnet_3.id
  ]

  /*
    listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  */

  listener {
    instance_port = 8080
    instance_protocol = "http"
    lb_port = 8080
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/"
    interval = 10
  }

  instances = [ 
    aws_instance.server1.id,
    aws_instance.server2.id
  ]

  cross_zone_load_balancing = true
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400

  tags = {
    Name = "Elastic Balancer Latam"
  }
}