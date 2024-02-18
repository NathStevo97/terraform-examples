#specify project name
variable "project" {
        default = "reflected-gamma-246214"
}
#specify vm instance name
variable "name" {
        default = "test"
}
#specify vm machine type
variable "machine_type" {
        default = "n1-standard-1"
}
#specify vm zone to be deployed in
variable "zone" {
        default = "europe-west1-b"
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
                "wget"
	]
}

variable "install_packages" {
        default = {
                "yum" = "sudo yum install -y",
                "apt" = "sudo apt install -y"
        }
}

variable "script" {
        default = "scripts/flask_deploy.sh"
}

variable "allowed_ports" {
        default = ["22","8080", "5432", "4200", "5050", "80", "5000"]
}

