variable "desired_capacity" {
    description = "desired capacity for asg"
    default = 1
}
variable "max_size" {
    description = "max size for asg"
    default = 3
}
variable "min_size" {
  description = "min size of asg"  
  default = 1
}

variable "vpc_zone_identifier" {
    description = "id of availability zones"
}