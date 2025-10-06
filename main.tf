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

data "google_compute_image" "debian"{
    family = "debian-12"
    project = "debian-cloud"
} 

#VM instance
resource "google_compute_instance" "vm" {
    name = var.instance_name
    machine_type = var.machine_type
    zone = var.zone

    # Tag for firewall rules 
    tags = ["intern-assignment"]

    labels = {
        student = var.student_name
    }

    boot_disk{
        initialize_params{
            image = data.google_compute_image.debian.self_link
        }
    }
    
    #Network interfae with external IP
    network_interface {
      network = "default"

      access_config {
        #external IP 
      }
    }
}

