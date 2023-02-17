variable "vmname" {
    type = string
    description = "The Name of the Virtual Machine."
}
variable "location" {
    type = string
    description = "Azure location."
}
variable "resource_group_name" {
    type = string
    description = "Name of the resource group."
}
variable "subnet_id" {
    type = string
    description = "ID of the subnet."
}
variable "private_ip_address" {
    type = string
    description = "The static IP address of the VM."
}
variable "public_ip_address_id" {
    type = string
    description = "The ID of the public IP."
}