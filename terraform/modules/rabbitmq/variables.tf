variable "rabbitmq_name" {
	description = "Name of the RabbitMQ instance"
	type        = string
}

variable "location" {
	description = "Azure location for RabbitMQ"
	type        = string
}

variable "resource_group_name" {
	description = "Resource group name where RabbitMQ will be created"
	type        = string
}

variable "sku" { default = "Standard" }

variable "subnet_id" {
	description = "Subnet id for RabbitMQ"
	type        = string
}
