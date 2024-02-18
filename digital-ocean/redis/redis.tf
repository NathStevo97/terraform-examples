resource "digitalocean_database_cluster" "redis" {
  name       = "redis-cluster"
  engine     = "redis"
  version    = "6"
  size       = "db-s-1vcpu-1gb"
  region     = "nyc1"
  node_count = 1
}