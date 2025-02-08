# modules/subnet/variables.tf
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
}

variable "availability_zone_public" {
  description = "Availability zone for public subnet"
  type        = string
}

variable "availability_zone_private" {
  description = "Availability zone for private subnet"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "internet_gateway_id" {
  description = "Internet Gateway ID"
  type        = string
}