

#create resource group for resource allocation
resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}-resources"
  location = var.location
}

#create virtual network
resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

#create the subnet for the virtual network
resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefix       = "10.0.2.0/24"
}
#create public IPs
resource "azurerm_public_ip" "main" {
  name                = "myPublicIP"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Dynamic"
  domain_name_label   = "nathan-${formatdate("DDMMYYhhmmss", timestamp())}"
}

#create network security group and rule	
resource "azurerm_network_security_group" "main" {
  name                = "myNetworkSecurityGroup"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

#create network interface card (NIC) for use in virtual network
resource "azurerm_network_interface" "main" {
  name                = "${var.prefix}-nic"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.main.id
  }
  depends_on = [azurerm_network_security_group.main, azurerm_subnet.internal, azurerm_public_ip.main]
}


# Create a Linux virtual machine
resource "azurerm_linux_virtual_machine" "main" {
  name                            = "${var.prefix}-vm"
  resource_group_name             = azurerm_resource_group.main.name
  location                        = azurerm_resource_group.main.location
  size                            = "Standard_F2"
  admin_username                  = "adminuser"
  admin_password                  = "P@ssw0rd1234!"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.main.id,
  ]

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  provisioner "remote-exec" {
    inline = [
      "ls -la /tmp",
    ]

    connection {
      host     = self.public_ip_address
      user     = self.admin_username
      password = self.admin_password
    }
  }
}


/* Ignore the following, this is additional configuration I may implement for future examples

  os_profile {
    computer_name  = "hostname"
    admin_username = "nstephenson"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = true
     ssh_keys {
			path = "/home/nstephenson/.ssh/authorized_keys"
			key_data = "${file("/home/nstephenson/.ssh/id_rsa.pub")}" # ~/.ssh/id_rsa.pub in windows
			} 
        

  }

provisioner "remote-exec" {
        inline = ["sudo apt update", "sudo apt install -y jq", "mkdir Repos", "cd Repos", "git clone https://github.com/NathStevo97/Jenkins_Automation]
		inline = ["sudo apt update", "sudo apt install -y jq", "mkdir Repos", "cd Repos", "git clone https://github.com/NathStevo97/Jenkins_Automation", "cd Jenkins_Automation", "./jenkins_install.sh"]
		connection {
			type = "ssh"
			user = "nstephenson"
			private_key = file("/home/nstephenson/.ssh/id_rsa")
			host = "${azurerm_public_ip.main.fqdn}"
			}
		}
        
}
*/