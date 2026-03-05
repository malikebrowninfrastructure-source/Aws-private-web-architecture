# Bastion Host Access

## Goal
Provide controlled SSH access to private EC2 instances.

## Architecture

Laptop → Bastion Host → Private Instance

## Configuration

Security group rules:

Inbound:
SSH (22) from my public IP

Outbound:
All traffic allowed

Private server security group:

Inbound:
SSH from bastion security group

## SSH Access

Connect to bastion:
