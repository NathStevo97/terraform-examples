resource "google_compute_network" "vpc_network" {
  name = "gcp-demo-network"
}

resource "google_compute_instance" "vm_instance" {
  name         = "gcp-demo-vm"
  machine_type = "f1-micro"
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