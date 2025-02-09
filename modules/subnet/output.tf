output "public_subnet_id" {
  value = aws_subnet.public.id
}
output "public1_subnet_id" {
  value = aws_subnet.public1.id
}
output "private_subnet_id" {
  value = aws_subnet.private.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}