variable "aks_name" {
	description = "Name of the AKS cluster"
	type        = string
}

variable "location" {
	description = "Azure location for the AKS cluster"
	type        = string
}

variable "resource_group_name" {
	description = "Resource group name where AKS will be deployed. Caller must provide (no default)."
	type        = string
}

variable "dns_prefix" {
	description = "DNS prefix for the AKS cluster"
	type        = string
}

variable "node_pool_name" { default = "default" }

variable "node_count" { default = 1 }

variable "vm_size" { default = "Standard_DS2_v2" }

variable "subnet_id" {
	description = "VNet subnet id for AKS node pool"
	type        = string
}
