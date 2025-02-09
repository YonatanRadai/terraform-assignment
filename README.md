# Terraform Assignment - Custom VPC & EC2 Infrastructure

This repository contains Terraform configurations for setting up a custom AWS VPC with public and private subnets, deploying EC2 instances, implementing an Application Load Balancer (ALB) with Auto Scaling, and organizing the infrastructure into reusable modules. This project demonstrates infrastructure as code (IaC) practices using Terraform to create a modular and scalable AWS environment.

## Features

- **Custom VPC**: Creates a VPC with designated public and private subnets.
- **Internet Connectivity**: Configures an Internet Gateway and appropriate routing for the public subnet.
- **EC2 Deployment**: Deploys an Ubuntu 22.04 EC2 instance within the public subnet.
- **Security Setup**: Implements security groups for SSH and HTTP access.
- **Modular Design**: Utilizes modules to make the configuration reusable and maintainable.
- **Load Balancer & Auto Scaling**: Sets up an Application Load Balancer with auto-scaling to manage traffic and ensure high availability.

## Requirements

- [Terraform](https://www.terraform.io/downloads.html) (v0.12+ recommended)
- [AWS Account](https://aws.amazon.com/)
- AWS CLI configured with Administrator access

## Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone https://github.com/YonatanRadai/terraform-assignment.git
   cd terraform-assignment
   ```

2. **Initialize Terraform**
   ```bash
   terraform init
   ```

3. **Create Terraform Plan**
   ```bash
   terraform plan
   ```

4. **Apply Configuration**
   To apply the configuration to your AWS environment, run:
   ```bash
   terraform apply
   ```
   Confirm the apply when prompted.

## Usage

After deploying the infrastructure, you can:

- **Access the EC2 instance via SSH**: Use the outputted public IP address.
- **View the HTTP service**: Accessible via the EC2 public IP if configured.
- **Navigate to the ALB DNS name**: To access your application through the load balancer.

## Outputs

- **`ec2_public_ip`**: The public IP address of the deployed EC2 instance.
- **`alb_dns_name`**: The DNS name of the Application Load Balancer.
- **`private_subnet_id`**: The private subnet id.
- **`public_subnet_id`**: The public subnet id.
- **`vm_public_ip`**: The ec2 instance it crates ip.
- **`vpc_id`**: the vpc it crates id.


## Cleanup

To avoid ongoing AWS charges, you can destroy the Terraform-managed infrastructure using:
```bash
terraform destroy
```
