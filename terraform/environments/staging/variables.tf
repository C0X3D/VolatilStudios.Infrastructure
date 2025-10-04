variable "location" { default = "westeurope" }
variable "environment" { default = "staging" }
variable "client" {}
variable "resource_group_name" { default = "${var.client}-staging-rg" }
variable "pg_admin_login" {}
variable "pg_admin_password" {}
