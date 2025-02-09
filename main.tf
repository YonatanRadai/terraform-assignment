# root/main.tf
provider "aws" {
  region = "us-east-1" 
}

module "vpc" {
  source                = "./modules/vpc"
  vpc_cidr              = "10.0.0.0/16"
  environment           = "dev"
  public_subnet_cidr    = "10.0.1.0/24"
  private_subnet_cidr   = "10.0.2.0/24"
  availability_zone_public  = "us-east-1a"
  availability_zone_private = "us-east-1b"
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
  depends_on = [ module.vpc ]
}

module "subnet" {
  source = "./modules/subnet"

  vpc_id                = module.vpc.vpc_id
  vpc_cidr = module.vpc.vpc_cidr
  public_subnet_cidr    = "10.0.1.0/24"
  public1_subnet_cidr = "10.0.3.0/24"
  private_subnet_cidr   = "10.0.2.0/24"
  availability_zone_public  = "us-east-1a"
  availability_zone_public1 = "us-east-1c"
  availability_zone_private = "us-east-1b"
  environment           = "dev"
  internet_gateway_id   = module.vpc.internet_gateway_id
  depends_on = [ module.vpc ]
}

module "instance" {
  source = "./modules/instance"
  ami                   = "ami-0e1bed4f06a3b463d"
  type                  = "t2.micro"
  associate_public_ip   = true
  machine_name          = "yonatan_machine-8"
  subnet_id             = module.subnet.public_subnet_id
  vpc_id                = module.vpc.vpc_id
  depends_on = [ module.subnet, module.security_group]
  security_group_id = module.security_group.security_group_id
}

module "alb" {
  source = "./modules/alb"
  vpc_id = module.vpc.vpc_id
  name = "yonatan-alb-8"
  subnets_ids = [module.subnet.public_subnet_id, module.subnet.public1_subnet_id]
  security_groups_id = [module.security_group.alb_security_group_id]
}

module "autoscaling" {
  source = "./modules/autoscaling"
  
  ami_id            = "ami-0e1bed4f06a3b463d"  
  instance_type     = "t2.micro"
  security_group_id = module.security_group.asg_security_group_id
  target_group_arn  = module.alb.target_group_arn
  subnet_ids        = [module.subnet.private_subnet_id]
  min_size         = 1
  max_size         = 3
  desired_capacity = 1
}

