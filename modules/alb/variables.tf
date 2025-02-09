variable "vpc_id" {
    description = "the vpc id for the security group"
}
variable "name" {
    description = "name of the alb"
    default = "alb" 
}
variable "subnets_ids" {
    description = "subnet the alb is in"
}
variable "security_groups_id" {
    description = "security groups id"
}

