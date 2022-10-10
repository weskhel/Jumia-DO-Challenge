resource "aws_lb" "jumia-phone-ALB" {
    name = "jumia-phone-ALB"
    internal = false
    ip_address_type = "ipv4"
    load_balancer_type = "application"
    security_groups = [aws_security_group.jumia-phone-ALB-sg.id]
    subnets = [var.private_network_cidr, var.public_network_cidr]
    enable_cross_zone_load_balancing = true
    tags = {
       Tier = "Public"
  }
}
#    subnet_mapping {
#    subnet_id     = var.public_subnet_us_east_1a
#    allocation_id = aws_eip.app_us_east_1a.id
#  }
#    subnet_mapping {
#      subnet_id     = var.public_subnet_us_east_1b
#      allocation_id = aws_eip.app_us_east_1b.id
#  }

resource "aws_lb_listener" "listener_http" {
  load_balancer_arn = "${aws_lb.jumia-phone-ALB.arn}"
  port              = "8081"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_lb_target_group.jumia-phone-ALB-tg.arn}"
    type             = "forward"
  }
}
resource "aws_lb_target_group" "jumia-phone-ALB-tg" {
  name     = "jumia-phone-ALB-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id      = data.aws_vpc.default.id
  target_type = "instance"
  stickiness {
    type = "lb_cookie"
  }
}
resource "aws_lb_target_group_attachment" "jumia-phone-ALBa" {
  target_group_arn = aws_lb_target_group.jumia-phone-ALB-tg.arn
  target_id        = aws_instance.jumia_phone_validator.id
  port             = 80
}