# AWS Private Web Architecture

This project demonstrates a secure AWS infrastructure design using a bastion host and private application servers.

The architecture simulates a common enterprise pattern where application servers run in private subnets while administrative access is controlled through a bastion host.

---

# Architecture Diagram

![VPC Architecture](architecture/vpc-architecture.png)

---

# Key Architecture Components

| Component | Purpose |
|----------|--------|
| VPC | Isolated AWS network |
| Public Subnet | Bastion host for SSH access |
| Private Subnet | Application server |
| Bastion Host | Controlled administrative access |
| NGINX | Web server running on private instance |
| Instance Metadata Service | Accessed securely with IMDSv2 |

---

# Design Documentation

- [Architecture Decisions](docs/architecture-decisions.md)
- [Network Design](docs/network-design.md)
- [Security Model](docs/security-model.md)

---

# Infrastructure Implementation

- [VPC Build Notes](infrastructure/vpc-build-notes.md)
- [Subnet Design](infrastructure/subnet-design.md)
- [Routing Design](infrastructure/routing-design.md)

---

# Access Architecture

- [Bastion Host](access/bastion-host.md)
- [SSH Agent Forwarding](access/ssh-agent-forwarding.md)
- [SSH Multiplexing](access/ssh-multiplexing.md)

---

# Services

- [NGINX Server Setup](services/nginx-server.md)
- [Metadata Service Access](services/metadata-service.md)

---

# Troubleshooting

- [Metadata 401 Debug](troubleshooting/metadata-401-debug.md)
