# AWS Systems Manager Session Manager Access

## Overview

This architecture was upgraded to support secure instance access using AWS Systems Manager Session Manager.

Session Manager allows shell access to EC2 instances without requiring:

- SSH keys
- inbound port 22
- public IP addresses
- bastion host dependency for day-to-day administration

This provides a more modern and secure administrative access pattern for private EC2 instances.

---

## Why Session Manager Was Added

The original architecture used a bastion host for SSH access to private instances.

Access path:

Engineer Laptop → Bastion Host → Private EC2 Instances

This works, but it has operational drawbacks:

- SSH access depends on source IP allow-listing
- changing public IP addresses can break access
- port 22 must remain open to the bastion host
- key management becomes an additional administrative task

Session Manager improves this by allowing browser-based or CLI-based access through AWS Systems Manager.

---

## Updated Access Pattern

New administrative access flow:

Engineer Laptop → AWS Console / AWS Systems Manager → Private EC2 Instances

This allows access from any network location, provided the user has the required IAM permissions.

---

## Requirements

For Session Manager to work, EC2 instances must have:

1. SSM Agent installed  
2. outbound connectivity to AWS Systems Manager endpoints  
3. an IAM role attached with the required Systems Manager permissions  

Amazon Linux 2023 includes the SSM Agent by default.

---

## IAM Role Configuration

An EC2 IAM role was created and attached to the web servers.

Role name:

```text
EC2-SSM-Role
