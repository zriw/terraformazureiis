variable "sgname" {
    type = string
    description = "The Name of the Security Group."
}
variable "location" {
    type = string
    description = "Azure location."
}
variable "resource_group_name" {
    type = string
    description = "Name of the resource group."
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