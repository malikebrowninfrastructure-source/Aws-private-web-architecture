# Routing Design

## Goal
Control how traffic flows between public and private subnets.

## Public Route Table

Destination | Target
-----------|--------
0.0.0.0/0 | Internet Gateway

Attached Subnets:
- Public subnet

## Private Route Table

Destination | Target
-----------|--------
10.0.0.0/16 | local

Attached Subnets:
- Private subnet

## Validation

Check routing inside instance:
