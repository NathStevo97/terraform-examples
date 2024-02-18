#specify project name
variable "project" {
        default = "reflected-gamma-246214"
}
#specify vm instance name
variable "name" {
        default = "default"
}
#specify vm machine type
variable "machine_type" {
        default = "f1-micro"
}
#specify vm zone to be deployed in
variable "zone" {
        default = "europe-west2-c"
}
#specify vm image or operating system to run
variable "image" {
        default = "ubuntu-1804-lts"
}
#specify network to run on vm
variable "network" {
        default = "default"
}

variable "ssh_user" {
        default = "terraform"
}
#specify public key location for user to communicate via
variable "public_key" {
        default = "~/.ssh/id_rsa.pub"
}
#specity private key location
variable "private_key" {
        default = "~/.ssh/id_rsa"
}

variable "package_manager" {
        default = "apt"
}

variable "update_packages" {
        default = {

                "apt" = "sudo apt update && sudo apt upgrade -y"
        }
}

variable "packages" {
        default = [
                "wget",
                "unzip"
        ]
}

variable "install_packages" {
        default = {
                "apt" = "sudo apt install -y"
        }
}

variable "scripts-db" {
        default = []
}

variable "scripts-api" {
        default = []
}

variable "scripts-ui" {
        default = []
}

variable "allowed_ports" {
        default = [
		   "22",
		   "8080",
		   "27017",
		   "4200"]
}

