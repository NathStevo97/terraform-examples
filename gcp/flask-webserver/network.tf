resource "google_compute_network" "vpc_network" {
  name                    = "flask-server-network"
  auto_create_subnetworks = false # don't auto-create subnets with this vnet
  mtu                     = 1460  # maximum transmission unit (bytes)
}

resource "google_compute_subnetwork" "vpc_subnet" {
  name          = "flask-server-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = var.region
  network       = google_compute_network.vpc_network.name
}