# SSH Multiplexing

## Overview

SSH multiplexing allows multiple SSH sessions to reuse a single existing SSH connection. Instead of creating a new TCP connection and performing authentication each time, additional SSH sessions can reuse the original authenticated connection.

This greatly improves performance and reduces the overhead of repeatedly connecting to remote systems.

In this lab environment, SSH multiplexing was used to improve connectivity efficiency when accessing AWS EC2 instances through a bastion host.

Architecture used in this project:

Local Machine → Bastion Host → Private App Server → Private Web Server

Multiplexing allows repeated SSH access to the bastion host without performing a full SSH handshake each time.

---

## Problem Without Multiplexing

Normally every SSH connection performs several steps:

1. TCP connection setup
2. SSH key exchange
3. Encryption negotiation
4. User authentication

When connecting frequently, this introduces noticeable latency.

Example:
ssh ec2-user@bastion-host
ssh ec2-user@bastion-host
ssh ec2-user@bastion-host

Each connection performs a full authentication process.

---

## What SSH Multiplexing Does

SSH multiplexing creates a **master connection** that additional SSH sessions reuse.

Workflow:

1. First SSH connection establishes a master connection
2. A control socket is created on the client machine
3. Future SSH connections reuse that socket
4. Authentication does not need to occur again

This dramatically reduces connection time.

---

## SSH Multiplexing Configuration

Multiplexing is configured in the SSH client configuration file.

Edit the SSH config file:
nano ~/.ssh/config

configuration:
Host *
ControlMaster auto
ControlPath ~/.ssh/control-%r@%h:%p
ControlPersist 10m


Using multiplexing reduced authentication overhead when repeatedly connecting to the bastion host.

---

## Security Considerations

SSH multiplexing should be used carefully.

Best practices include:

- Store control sockets in secure directories
- Avoid enabling multiplexing on shared systems
- Use short ControlPersist timeouts
- Ensure proper SSH key management

---

## Summary

SSH multiplexing allows multiple SSH sessions to reuse a single authenticated connection. This reduces connection overhead and improves workflow efficiency when managing remote systems.

In this AWS lab environment, multiplexing improved the speed of repeated SSH connections to the bastion host while working with private EC2 instances.
