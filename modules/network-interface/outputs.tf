output "nic_id" {
    description = "ID of the network interface."
    value = azurerm_network_interface.web-server-nic.id
}