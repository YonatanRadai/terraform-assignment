resource "aws_instance" "ec2" {
    ami = var.ami
    instance_type = var.type
    security_groups = [aws_security_group.sg.id]
    tags = {
        name = var.machine_name
    }
    subnet_id = var.subnet_id
  
}
