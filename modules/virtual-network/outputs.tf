output "subnet_id" {
    description = "ID of the subnet."
    value = azurerm_subnet.web-server-subnet.id
}
output "public_ip_id" {
    description = "ID of the public IP."
    value = azurerm_public_ip.web-server-pubip.id
}