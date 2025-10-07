# Terraform GCP Infrastructure Assignment

**Author:** Sondre Nodenes-Fimland

## Overview

This repository contains an Infrastructure as Code (IaC) solution for deploying a secure web server on Google Cloud Platform using Terraform.

**Implemented**:
- VM instance (e2-micro, Debian 12)
- SSH access via Identity-Aware Proxy (IAP)
- HTTP/HTTPS firewall rules
- Automated Nginx web server
- DNS A record
- Let's Encrypt TLS certificate


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

## Deploy:
```bash 
terraform init
terraform plan
terraform apply
```

## Access info
```bash
terraform output
```

### Connect to VM
```bash
gcloud compute ssh px-intern-vm \
  --zone=europe-north1-a \
  --tunnel-through-iap \
  --project=optimal-shard-332612
```
