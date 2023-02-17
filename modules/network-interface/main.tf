resource "azurerm_network_interface" "web-server-nic" {
    name                = "${var.vmname}-nic"
    location            = var.location
    resource_group_name = var.resource_group_name
    ip_configuration {
        name                          = "ipcon-1"
        subnet_id                     = var.subnet_id
        private_ip_address_allocation = "Static"
        private_ip_address            = var.private_ip_address
        public_ip_address_id          = var.public_ip_address_id
    }
}