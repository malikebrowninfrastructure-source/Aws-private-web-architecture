# AWS Instance Metadata 401 Error Debug

## Overview

While attempting to retrieve EC2 instance metadata from a private server, the request returned a **401 Unauthorized** error.

This document explains the root cause and resolution.

---

# Problem

Attempting to access the metadata service returned:

curl http://169.254.169.254/latest/meta-data/

Result:

401 Unauthorized

The request was being rejected by the metadata service.

---

# Environment

Architecture:

Laptop → Bastion Host → Private EC2 Instance

Instance configuration:

- Amazon Linux
- EC2 instance in private subnet
- Access via bastion host
- Instance Metadata Service enabled

---

# Investigation Steps

### 1. Verify metadata endpoint

Checked connectivity to metadata service:


## Lab 2 - Auto Scaling Launch Template Metadata Issue

### Problem
The Application Load Balancer page displayed:

Web Server Instance:

without the EC2 instance ID.

### Cause
The Auto Scaling instances were launched from a launch template that required IMDSv2.
The original user-data script attempted to retrieve metadata using an IMDSv1-style request:

```bash
curl http://169.254.169.254/latest/meta-data/instance-id
