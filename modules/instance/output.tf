output "vm_public_ip" {
  description = "Public IP address of the VM"
  value       = aws_instance.ec2.public_ip
}

