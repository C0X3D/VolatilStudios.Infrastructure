variable "redis_name" {}
variable "location" {}
variable "resource_group_name" {}
variable "capacity" { default = 1 }
variable "family" { default = "C" }
variable "sku_name" { default = "Basic" }
variable "enable_non_ssl_port" { default = false }

variable "subnet_id" {}
