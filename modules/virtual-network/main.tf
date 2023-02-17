resource "azurerm_virtual_network" "web-server-net" {
  name                     = var.virtual_network_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  address_space            = var.virtual_network_address_space
}

resource "azurerm_subnet" "web-server-subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.subnet_address_prefixes
}

resource "azurerm_public_ip" "web-server-pubip" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Dynamic"
}