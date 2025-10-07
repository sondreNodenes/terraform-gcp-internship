output "vm_external_ip" {
  description = "External IP address of the debian VM as an URL"
  value = "http://${google_compute_instance.vm.network_interface[0].access_config[0].nat_ip}"
}

output "vm_http_url" {
  description = "HTTP URL to access the web server (redirects to HTTPS)"
  value = "http://vm.sandbox4.vcops.tech"
}

output "vm_https_url" {
  description = "HTTPS URL to access the web server"
  value = "https://vm.sandbox4.vcops.tech"
}

output "vm_name" {
  description = "Name of the VM instance"
  value = google_compute_instance.vm.name
}