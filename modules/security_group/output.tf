output "security_group_id" {
  value = aws_security_group.sg.id
}

output "alb_security_group_id" {
  value = aws_security_group.alb_sg.id
}

output "asg_security_group_id" {
  value = aws_security_group.asg_sg.id
}