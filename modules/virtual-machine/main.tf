resource "azurerm_windows_virtual_machine" "web-server-vm" {
  name                  = var.vmname
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = var.network_interface_ids
  size                  = var.vm_size
  custom_data           = filebase64("./data/data.txt")

  admin_username = var.admin_usename
  admin_password = var.admin_password

  os_disk {
    name                 = "${var.vmname}-disk"
    storage_account_type = var.os_disk_type
    caching              = "ReadWrite"
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = "latest"
  }

}