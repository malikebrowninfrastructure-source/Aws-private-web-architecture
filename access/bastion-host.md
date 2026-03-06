# Bastion Host Access

Private EC2 instances reside in private subnets and cannot be accessed directly from the internet.

SSH access is performed through a bastion host located in a public subnet.

## Connection Flow

Local machine → Bastion Host → Private EC2 instance

Example:

ssh -i bastion-key.pem ec2-user@bastion-public-ip

Then from bastion:

ssh ec2-user@10.10.10.x
