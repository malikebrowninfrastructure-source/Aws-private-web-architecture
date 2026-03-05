# Subnet Design

## Goal
Segment the VPC into public and private networks to separate internet-facing infrastructure from internal services.

## Subnet Layout

| Subnet | CIDR | Purpose |
|------|------|------|
| Public Subnet | 10.0.1.0/24 | Bastion host and internet access |
| Private Subnet | 10.0.2.0/24 | Application server |

## Public Subnet

Resources deployed:
- Bastion Host

Routing:
- Route to Internet Gateway

## Private Subnet

Resources deployed:
- NGINX web server

Routing:
- Internal VPC routing only

## Lessons Learned

Private subnets cannot reach the internet without a NAT gateway.
