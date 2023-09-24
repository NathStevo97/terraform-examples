resource "google_compute_instance" "vm_instance" {
  name         = "flask-server-vm"
  machine_type = "f1-micro"
  zone         = var.zone
  tags         = ["web", "ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  
  metadata = {
    ssh-keys = "natstephenson15:${file("~/.ssh/id_rsa.pub")}"
  }

  network_interface {
    subnetwork = google_compute_subnetwork.vpc_subnet.id

    access_config {

    }
  }

  provisioner "file" {
    source = "files/app.py"
    destination = "/home/natstephenson15/app.py"

    connection {
      type = "ssh"
      user = "natstephenson15"
      private_key = file("~/.ssh/id_rsa")
      agent = false
      host = "${google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip}"
    }
  }

  provisioner "file" {
    source = "files/startup.sh"
    destination = "/home/natstephenson15/startup.sh"

    connection {
      type = "ssh"
      user = "natstephenson15"
      private_key = file("~/.ssh/id_rsa")
      agent = false
      host = "${google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip}"
    }
  }
    
  provisioner "remote-exec" {

    inline = [
      "chmod +x /home/natstephenson15/startup.sh",
      "/home/natstephenson15/startup.sh"
    ]

    connection {
      type = "ssh"
      user = "natstephenson15"
      private_key = file("~/.ssh/id_rsa")
      agent = false
      host = "${google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip}"
    }
  }
}