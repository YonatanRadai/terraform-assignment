resource "aws_lb" "alb" {
  name               = var.name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_groups_id
  subnets            = var.subnets_ids
  
}

resource "aws_lb_target_group" "tg" {
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
  

  health_check {
    enabled = true
    interval = 30
    path ="/"
    port = "traffic-port"
    protocol = "HTTP"
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 5
  }
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port = 80
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}