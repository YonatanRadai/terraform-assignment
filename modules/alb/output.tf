output "alb_dns" {
    value = aws_lb.alb.dns_name
  
}
output "target_group_arn" {
  value = aws_lb_target_group.tg.arn
  description = "The ARN of the target group"
}