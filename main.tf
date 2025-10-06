#Terraform version and google requirements
terraform {
  required_version = ">= 1.0"

  required_providers {
    google = {
        source = "hashicorp/google"
        version = "~> 5.0"
    }
  }
}

#GCP provider, reuse variables from variables.tf
provider "google" {
  project = var.project_id
  region = var.region
  zone = var.zone
}