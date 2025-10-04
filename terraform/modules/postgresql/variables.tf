variable "postgresql_name" {}
variable "location" {}
variable "resource_group_name" {}
variable "administrator_login" {}
variable "administrator_password" {}
variable "sku_name" { default = "Standard_B1ms" }
variable "postgresql_version" { default = "13" }
variable "storage_mb" { default = 32768 }
variable "backup_retention_days" { default = 7 }
variable "geo_redundant_backup_enabled" { default = false }

variable "subnet_id" {}
