# modules/vpc/outputs.tf
output "vpc_id" {
  value = aws_vpc.main[0].id
}

output "vpc_cidr" {
  value = aws_vpc.main[0].cidr_block
}

output "internet_gateway_id" {
  value = aws_internet_gateway.main.id
}