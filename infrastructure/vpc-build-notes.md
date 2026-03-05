# VPC Build Notes

## Goal
Create a VPC with public and private subnets to host a bastion host and a private web server.

## Steps

1. Create VPC
   - CIDR: 10.0.0.0/16

2. Create subnets
   - Public subnet: 10.0.1.0/24
   - Private subnet: 10.0.2.0/24

3. Attach Internet Gateway

4. Create route tables
   - Public route table → IGW
   - Private route table → internal only

## Validation

Verify routing:
