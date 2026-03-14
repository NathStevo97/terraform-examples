resource "google_compute_instance" "vm_instance" {
  name         = "${var.resource_prefix}-vm"
  machine_type = var.machine_type
  tags         = ["web", "dev"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}
