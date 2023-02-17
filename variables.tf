variable "resource_group_name" {
    type        = string
    description = "Name of the Resource Group."
}
variable "location" {
    type        = string
    description = "Location of the Virtual Network."
}
variable "virtual_network_name" {
    type        = string
    description = "Name of the Virtual Vetwork."
}
variable "virtual_network_address_space" {
    type        = list(string)
    description = "IP address space of the Virtual Network."
}
variable "subnet_name" {
    type        = string
    description = "The Subnet name of the Virtual Network."
}
variable "private_ip_address" {
    type = string
    description = "The static IP address of the VM."
}
variable "subnet_address_prefixes" {
    type        = list(string)
    description = "The network prefix of the Virtual Network."
}
variable "subscription_id" {
    type        = string
    description = "The ID of the Azure subscription."
}
variable "sgname" {
    type        = string
    description = "The Name of the Security Group."
}
variable "vmname" {
    type        = string
    description = "The name of the Virtual Machine."
}
variable "vm_size" {
    type        = string
    description = "size of the virtual machine"
}
variable "os_disk_type" {
    type        = string
    description = "Type of the OS disk."
}
variable "admin_usename" {
    type        = string
    description = "Admin user of the VM."
}
variable "admin_password" {
    type        = string
    description = "Password of the admin user."
}
variable "image_publisher" {
    type        = string
    description = "Azure image publisher."
    default     = "MicrosoftWindowsServer"
}
variable "image_offer" {
    type        = string
    description = "Azure image offer."
    default     = "WindowsServer"
}
variable "image_sku" {
    type        = string
    description = "Azure image sku."
    default = "2019-Datacenter"
}
variable "security_rule_name" {
    type = string
    description = "Name of the security rule"
}
variable "priority_number" {
  type = number
  description = "Value of the priority"
}
variable "destination_port_ranges" {
    type = list(number)
    description = "List if ports"
}
variable "public_ip_name" {
    type = string
    description = "The name of the public IP."
}