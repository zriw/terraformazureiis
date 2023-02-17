resource "azurerm_network_security_group" "connsg" {
  name                = var.sgname
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = var.security_rule_name
    priority                   = var.priority_number
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_ranges    = var.destination_port_ranges
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
