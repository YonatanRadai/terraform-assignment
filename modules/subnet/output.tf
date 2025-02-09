# modules/subnet/outputs.tf
output "public_subnet_id" {
  value = aws_subnet.public.id
}
output "public1_subnet_id" {
  value = aws_subnet.public1.id
}
output "private_subnet_id" {
  value = aws_subnet.private.id
}