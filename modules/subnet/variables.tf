variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
}
variable "public1_subnet_cidr" {
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
variable "availability_zone_public1" {
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

variable "subnet_count" {
  description = "Number of subnets to create"
  type        = number
  default     = 2
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}