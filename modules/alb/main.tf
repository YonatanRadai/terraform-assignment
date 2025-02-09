resource "aws_lb" "alb" {
  name               = var.name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg.id]
  subnets            = var.subnets_ids
  
}

resource "aws_lb_target_group" "tg" {
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
  

  health_check {
    enabled = false #did not ask for it in the task.
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