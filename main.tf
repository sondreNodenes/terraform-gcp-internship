#Terraform version and google requirements
terraform {
  required_version = ">= 1.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

#GCP provider, reuse variables from variables.tf
provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

data "google_compute_image" "debian" {
  family  = "debian-12"
  project = "debian-cloud"
}

#VM instance
resource "google_compute_instance" "vm" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  allow_stopping_for_update = true


  # Tag for firewall rules 
  tags = ["intern-assignment"]

  labels = {
    student = var.student_name
  }

  metadata_startup_script = file("${path.module}/startup-script.sh")

  #service account for VM
  service_account {
    scopes = ["cloud-platform"]
  }

  boot_disk {
    initialize_params {
      image = data.google_compute_image.debian.self_link
    }
  }

  #Network interface with external IP
  network_interface {
    network = "default"

    access_config {
      #external IP 
    }
  }
}

#Firewall rule to allow HTTP traffic from the whole internet (source_ranges) to intern-assignments
resource "google_compute_firewall" "allow_http" {
  name    = "allow-http-intern-assignment"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["intern-assignment"]
}

#Firewall rule to allow SSH from allowed groups/users
resource "google_compute_firewall" "allow_iap_ssh" {
  name    = "allow-iap-ssh-intern-assignment"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]

  }

  source_ranges = ["35.235.240.0/20"]
  target_tags   = ["intern-assignment"]
}

#IAM binding for IAP access, commented out becauses access was granted manually by admin
/*
resource "google_project_iam_member" "iap_tunnel_user" {
  project = var.project_id
  role = "roles/iap.tunnelResourceAccessor" #Assign member this role
  member = "user:sondrenf@gmail.com"
}

*/

# DNS A record pointing to VM's external IP
resource "google_dns_record_set" "vm_dns" {
  name         = "vm.sandbox4.vcops.tech."
  type         = "A"
  ttl          = 300
  managed_zone = "sandbox4-vcops-tech"

  rrdatas = [google_compute_instance.vm.network_interface[0].access_config[0].nat_ip]
}