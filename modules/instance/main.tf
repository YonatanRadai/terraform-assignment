resource "aws_instance" "ec2" {
    ami = var.ami
    instance_type = var.type
    security_groups = [var.security_group_id]
    associate_public_ip_address = var.associate_public_ip  
    tags = {
        name = var.machine_name
    }
    subnet_id = var.subnet_id
  
}
