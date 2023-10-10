variable "do_pat" {
  type        = string
  description = "DigitalOcean PAT - Stored as Env Variable"
}

variable "do_pvt_key" {
  type        = string
  description = "DigitalOcean SSH Key"
  default     = "~/.ssh/tf-digitalocean"
}