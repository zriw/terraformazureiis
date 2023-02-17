terraform {
    required_providers {
      azurerm = {
        source  = "hashicorp/azurerm"
        version = "3.43.0"
      }
    }
}
  
provider "azurerm" {
    subscription_id = var.subscription_id
  
    features {}
}

resource "azurerm_resource_group" "web-server-rg" {
  name     = var.resource_group_name
  location = var.location
}

module "virtual-network" {
  source = "./modules/virtual-network"

  virtual_network_name            = var.virtual_network_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  virtual_network_address_space   = var.virtual_network_address_space
  subnet_name                     = var.subnet_name
  subnet_address_prefixes         = var.subnet_address_prefixes
  public_ip_name                  = var.public_ip_name
}

module "network-interface" {
  source = "./modules/network-interface"

  vmname               = var.vmname
  location             = var.location
  resource_group_name  = var.resource_group_name
  subnet_id            = module.virtual-network.subnet_id
  private_ip_address   = var.private_ip_address
  public_ip_address_id = module.virtual-network.public_ip_id

}

module "virtual-machine" {
  source = "./modules/virtual-machine"

  vmname                  = var.vmname
  location                = var.location
  resource_group_name     = var.resource_group_name
  network_interface_ids   = [module.network-interface.nic_id]
  vm_size                 = var.vm_size
  os_disk_type            = var.os_disk_type
  admin_usename           = var.admin_usename
  admin_password          = var.admin_password
  image_publisher         = var.image_publisher
  image_offer             = var.image_offer
  image_sku               = var.image_sku
}

module "network-security" {
  source = "./modules/network-security"

  sgname                  = var.sgname
  location                = var.location
  resource_group_name     = var.resource_group_name
  security_rule_name      = var.security_rule_name
  priority_number         = var.priority_number
  destination_port_ranges = var.destination_port_ranges

}

module "network-security-association" {
  source = "./modules/network-security-association"

  network_interface_ids     = module.network-interface.nic_id
  network_security_group_id = module.network-security.sg_id
  
}
 
module "install-iis" {
  source = "./modules/install-iis"
  depends_on = [
    module.virtual-machine
  ]
  virtual_machine_id = module.virtual-machine.vm_id
}


output "public_ip" {
  value = module.virtual-machine.public_ip
}
