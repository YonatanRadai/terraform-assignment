variable "ami" {
    description = "ami id for ubuntu 22.04 in east-1"
    default = "ami-0e1bed4f06a3b463d"
}

variable "type" {
    description = "type of ec2 instance"
    default = "t2.micro"
}

variable "machine_name" {
    description = "the machine name"
    default = "yonatan_machine_8"
}
variable "subnet_id" {
    description = "the subnet id that the machine will be at"
}
variable "vpc_id" {
    description = "id of vpc in order to crate SG in that vpc"
}

variable "associate_public_ip" {
  description = "Whether to associate a public IP address to the instance"
  type        = bool
  default     = false
}
