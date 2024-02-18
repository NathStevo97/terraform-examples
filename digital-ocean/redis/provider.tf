terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_pat
}

data "digitalocean_ssh_key" "do_ssh" {
  name = "tf-digitalocean"
}