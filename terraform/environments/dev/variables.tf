variable "location" { default = "westeurope" }
variable "environment" { default = "dev" }
variable "client" {}
variable "resource_group_name" { default = "${var.client}-dev-rg" }

variable "pg_admin_login" {}
variable "pg_admin_password" {}
