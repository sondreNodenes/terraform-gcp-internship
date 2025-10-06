# GCP Project config
variable "project_id" {
  description = "GCP project ID"
  type = string
}

# Region and Zone config 
variable "region" {
  description = "GCP region for resources"
  type = string
  default = "europe-north1" #Closest to Norway
}

variable "zone" {
  description = "GCP zone for compute resources"
  type = string
  default = "europe-north1-a" #a in additon for zone (datacenter)
}

variable "student_name" {
  description = "Student name for labes"
  type = string 
  default = "sondre_nodenes"
}