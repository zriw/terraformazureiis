variable "virtual_network_name" {
    type = string
    description = "Name of the Virtual Network."
}
variable "resource_group_name" {
    type = string
    description = "Name of the Resource Group."
}
variable "virtual_network_address_space" {
    type = list(string)
    description = "IP address space of the Virtual Network."
}
variable "location" {
    type = string
    description = "Location of the Virtual Network."
}
variable "subnet_name" {
    type = string
    description = "The Subnet name of the Virtual Network."
}
variable "subnet_address_prefixes" {
    type = list(string)
    description = "The network prefix of the Virtual Network."
}
variable "public_ip_name" {
    type = string
    description = "The name of the public IP."
}