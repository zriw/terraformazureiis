variable "vmname" {
    type = string
    description = "The name of the Virtual Machine."
}
variable "resource_group_name" {
    type = string
    description = "The name of resource group."
}
variable "location" {
    type = string
    description = "Azure location."
}
variable "network_interface_ids" {
    type = list(string)
    description = "network interface id."
}
variable "vm_size" {
    type = string
    description = "size of the virtual machine"
}
variable "os_disk_type" {
    type = string
    description = "Type of the OS disk."
}
variable "admin_usename" {
    type = string
    description = "Admin user of the VM."
}
variable "admin_password" {
    type = string
    description = "Password of the admin user."
}
variable "image_publisher" {
    type = string
    description = "Azure image publisher."
}
variable "image_offer" {
    type = string
    description = "Azure image offer."
}
variable "image_sku" {
    type = string
    description = "Azure image sku."
}
