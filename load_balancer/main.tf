resource "aws_lb_target_group" "app_group" {
  name     = var.app_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc
}

resource "aws_lb_target_group_attachment" "attachment" {
  count            = length(var.instances)
  target_group_arn = aws_lb_target_group.app_group.arn
  target_id        = var.instances[count.index]
  port             = 80
}

resource "aws_lb" "app_lb" {
  name               = var.app_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets            = var.subnets
}

resource "aws_lb_listener" "app_fe" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_group.arn
  }
}