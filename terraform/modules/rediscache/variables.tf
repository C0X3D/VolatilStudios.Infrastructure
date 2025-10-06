variable "redis_name" {
	description = "Name of the Redis instance"
	type        = string
}

variable "location" {
	description = "Azure location for Redis"
	type        = string
}

variable "resource_group_name" {
	description = "Resource group name where Redis will be created"
	type        = string
}

variable "capacity" { default = 1 }
variable "family" { default = "C" }
variable "sku_name" { default = "Basic" }

variable "subnet_id" {
	description = "Subnet id for Redis"
	type        = string
}
