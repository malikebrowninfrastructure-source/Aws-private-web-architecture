# AWS Private Web Architecture

This project demonstrates a highly available web architecture on AWS using private subnets, a bastion host, an Application Load Balancer, and an Auto Scaling Group.

## Architecture Components

- VPC
- Public and private subnets
- Bastion host
- Application Load Balancer
- Target Group
- Auto Scaling Group
- NGINX web servers
- EC2 instance metadata service (IMDSv2)

## Key Features

- Highly available web tier
- Self-healing infrastructure via Auto Scaling
- Secure SSH access through bastion host
- Load-balanced HTTP traffic
- Automated instance bootstrap using user data scripts

## Architecture Flow

Client → Application Load Balancer → Target Group → Auto Scaling Web Servers

SSH access:

Engineer → Bastion Host → Private Instances
