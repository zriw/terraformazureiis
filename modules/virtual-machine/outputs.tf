output "vm_id" {
    description = "id of the vm"
    value = azurerm_windows_virtual_machine.web-server-vm.id
}
output "public_ip" {
    description = "the public ip"
    value = azurerm_windows_virtual_machine.web-server-vm.public_ip_address
}