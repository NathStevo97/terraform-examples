resource "digitalocean_loadbalancer" "nginx-lb" {
  name = "nginx-lb"
  region = "nyc3"

  forwarding_rule {
    entry_port = 80
    entry_protocol = "http"

    target_port = 80
    target_protocol = "http"
  }

  healthcheck {
    port = 22
    protocol = "tcp"
  }

  droplet_ids = [digitalocean_droplet.nginx-1.id, digitalocean_droplet.nginx-2.id ]
}