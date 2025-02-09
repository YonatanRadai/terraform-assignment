# resource "aws_autoscaling_group" "asg" {
#     desired_capacity = var.desired_capacity
#     max_size = var.max_size
#     min_size = var.min_size
#     vpc_zone_identifier = var.vpc_zone_identifier
# }