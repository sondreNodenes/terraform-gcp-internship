# Terraform GCP Infrastructure Assignment

**Author:** Sondre Nodenes-Fimland

## Overview
This repository contains an **IaC solution** for deploying a secure web server on **Google Cloud Platform (GCP)** using **Terraform**.

**Implemented**:
- VM instance (e2-micro, Debian 12)
- SSH access via Identity-Aware Proxy (IAP)
- HTTP/HTTPS firewall rules
- Automated Nginx web server
- DNS A record
- Let's Encrypt TLS certificate


## Web Access
- HTTPS: https://vm.sandbox4.vcops.tech
- HTTP (redirects to HTTPS): http://vm.sandbox4.vcops.tech

## Project Structure
```bash
.
├── .gitignore
├── .terraform.lock.hcl
├── main.tf
├── variables.tf
├── outputs.tf
├── startup-script.sh
└── README.md
```

## Requirements
- Google Cloud SDK authenticated
- Terraform >= 1.0
- IAP API must be enabled in the GCP project
- User must have IAM role `roles/iap.tunnelResourceAccessor` (managed by project administrators)
- Create a `terraform.tfvars` file with your GCP project ID:


## Deploy
```bash 
terraform init
terraform plan
terraform apply
```

## Outputs
```bash
terraform output
```

### Connect to VM (SSH via IAP)
---
```bash
gcloud compute ssh px-intern-vm \
  --zone=europe-north1-a \
  --tunnel-through-iap \
  --project=optimal-shard-332612
```