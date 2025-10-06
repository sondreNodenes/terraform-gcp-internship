output "vm_external_ip" {
  description = "External IP address of the debian VM as an URL"
  value = "http://${google_compute_instance.vm.network_interface[0].access_config[0].nat_ip}"
}

output "vm_name" {
  description = "Name of the VM instance"
  value = google_compute_instance.vm.name
}