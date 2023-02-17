resource "azurerm_network_interface_security_group_association" "conassociation" {
  network_interface_id      = var.network_interface_ids
  network_security_group_id = var.network_security_group_id
}