variable "location" { default = "westeurope" }
variable "environment" { default = "prod" }
variable "client" {}
variable "resource_group_name" { default = "${var.client}-prod-rg" }
variable "pg_admin_login" {}
variable "pg_admin_password" {}
