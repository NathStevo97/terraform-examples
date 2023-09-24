output "ip" {
  description = "IP Assigned to Google Compute Instance"
  value       = google_compute_instance.vm_instance.network_interface.0.network_ip
}
