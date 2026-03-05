SSH Agent Forwarding

Overview

SSH Agent Forwarding allows a user to authenticate to multiple remote servers without copying private SSH keys to intermediate systems. Instead, the authentication request is securely forwarded back to the SSH agent running on the user’s local machine.

In this AWS lab architecture, SSH Agent Forwarding enables secure access to private EC2 instances through a bastion host without storing private keys on the bastion server.

Architecture path used in this project:
Local Workstation
        │
        ▼
Bastion Host (Public Subnet)
        │
        ▼
Private App Server (Private Subnet)
        │
        ▼
Private Web Server (Private Subnet)

Why SSH Agent Forwarding is Used

In secure cloud environments, copying SSH private keys between servers is considered a security risk. SSH Agent Forwarding solves this by allowing authentication to be performed by the SSH agent running on the local machine.

Benefits include:
	•	Private SSH keys never leave the local workstation
	•	Bastion hosts do not store sensitive credentials
	•	Multi-hop SSH access becomes easier to manage
	•	Reduces key sprawl across servers

  How SSH Agent Forwarding Works

When agent forwarding is enabled, the SSH client forwards authentication requests back to the SSH agent running locally.

The process works as follows:
	1.	The user connects to the bastion host with agent forwarding enabled.
	2.	The bastion host receives an authentication request when connecting to another server.
	3.	Instead of using a local key, the bastion forwards the request to the user’s local SSH agent.
	4.	The SSH agent signs the authentication request using the local private key.
	5.	The private key itself never leaves the local machine.

This allows secure multi-hop SSH authentication.

Step 1 — Start the SSH Agent:
eval "$(ssh-agent -s)"

Step 2 — Add the SSH Key to the Agent:
ssh-add ~/.ssh/id_ed25519
verify key is loaded:
ssh-add -l

Step 3 — Connect to the Bastion Host with Agent Forwarding:
ssh -A ec2-user@<bastion-public-ip>

Step 4 — Access Private Instances from the Bastion Host:
ssh ec2-user@10.10.10.172

Verifying Agent Forwarding
echo $SSH_AUTH_SOCK
Example:
/tmp/ssh-XXXXXX/agent.1234
