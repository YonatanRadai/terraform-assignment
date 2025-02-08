# root/main.tf
provider "aws" {
  region = "us-east-1" 
}

module "vpc" {
  source                = "./modules/vpc"
  subnet_count          = 2
  vpc_cidr              = "10.0.0.0/16"
  environment           = "dev"
  public_subnet_cidr    = "10.0.1.0/24"
  private_subnet_cidr   = "10.0.2.0/24"
  availability_zone_public  = "us-east-1a"
  availability_zone_private = "us-east-1b"
}

module "subnet" {
  source = "./modules/subnet"

  vpc_id                = module.vpc.vpc_id
  public_subnet_cidr    = "10.0.1.0/24"
  private_subnet_cidr   = "10.0.2.0/24"
  availability_zone_public  = "us-east-1a"
  availability_zone_private = "us-east-1b"
  environment           = "dev"
  internet_gateway_id   = module.vpc.internet_gateway_id
}

module "instance" {
  source = "./modules/instance"
  ami                   = "ami-0e1bed4f06a3b463d"
  type                  = "t2.micro"
  machine_name          = "yonatan_machine_8"
  subnet_id             = module.subnet.public_subnet_id
  vpc_id                = module.vpc.vpc_id
}