variable "vnet_name" {
	description = "Name of the virtual network"
	type        = string
}

variable "vnet_address_space" { 
	description = "Address space for the virtual network"
	type        = list(string)
}

variable "location" {
	description = "Azure location for the VNet"
	type        = string
}

variable "resource_group_name" {
	description = "Resource group name where the VNet will be created"
	type        = string
}
