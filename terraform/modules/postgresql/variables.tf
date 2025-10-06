variable "postgresql_name" {
	description = "Name of the PostgreSQL server"
	type        = string
}

variable "location" {
	description = "Azure location for PostgreSQL"
	type        = string
}

variable "resource_group_name" {
	description = "Resource group name where PostgreSQL will be created"
	type        = string
}

variable "administrator_login" {
	description = "Administrator username for PostgreSQL"
	type        = string
}

variable "administrator_password" {
	description = "Administrator password for PostgreSQL"
	type        = string
	sensitive   = true
}

variable "sku_name" { default = "Standard_B1ms" }
variable "postgresql_version" { default = "13" }
variable "storage_mb" { default = 32768 }
variable "backup_retention_days" { default = 7 }
variable "geo_redundant_backup_enabled" { default = false }

variable "subnet_id" {
	description = "Subnet id for PostgreSQL"
	type        = string
}
