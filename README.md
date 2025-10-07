# Terraform GCP Infrastructure Assignment

**Author:** Sondre Nodenes-Fimland

## Overview

This repository contains an Infrastructure as Code (IaC) solution for deploying a secure web server on Google Cloud Platform using Terraform.

The assignment demonstrates:
- VM instance deployment on GCP Compute Engine
- Secure SSH access via Identity-Aware Proxy (IAP)
- Firewall configuration following security best practices
- Automated web server setup using startup scripts

## Connecting via SSH

SSH access is configured to work exclusively through Identity-Aware Proxy (IAP).


## Project Structure
```bash
.
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── startup-script.sh
└── README.md

```

## Requirements
- IAP API must be enabled in the GCP project
- User must have IAM role `roles/iap.tunnelResourceAccessor` (managed by project administrators)
- Firewall allows SSH only from IAP IP range (35.235.240.0/20)


### Connect to VM
```bash
gcloud compute ssh px-intern-vm \
  --zone=europe-north1-a \
  --tunnel-through-iap \
  --project=optimal-shard-332612



## Project Structure
- In progress
