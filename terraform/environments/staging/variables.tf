variable "location" { default = "westeurope" }

variable "environment" {
	type    = string
	default = "staging"
}

variable "client" {
	type = string
}

variable "resource_group_name" {
	type    = string
	default = ""
}

variable "pg_admin_login" {
	type = string
}

variable "pg_admin_password" {
	type      = string
	sensitive = true
}
