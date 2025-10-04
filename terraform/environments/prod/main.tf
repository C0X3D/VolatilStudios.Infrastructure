module "network" {
	source              = "../../modules/network"
	vnet_name           = "${var.client}-${var.environment}-vnet"
	vnet_address_space  = ["10.20.0.0/16"]
	location            = var.location
	resource_group_name = var.resource_group_name
}

# Outputs for subnet IDs:
# module.network.aks_subnet_id
# module.network.postgresql_subnet_id
# module.network.redis_subnet_id
# module.network.rabbitmq_subnet_id

module "aks" {
	source                = "../../modules/aks"
	aks_name              = "${var.client}-${var.environment}-aks"
	location              = var.location
	resource_group_name   = var.resource_group_name
	dns_prefix            = "${var.client}${var.environment}aks"
	node_pool_name        = "default"
	node_count            = 3
	vm_size               = "Standard_DS3_v2"
	subnet_id             = module.network.aks_subnet_id
}

module "postgresql" {
	source                  = "../../modules/postgresql"
	postgresql_name         = "${var.client}-${var.environment}-postgres"
	location                = var.location
	resource_group_name     = var.resource_group_name
	administrator_login     = var.pg_admin_login
	administrator_password  = var.pg_admin_password
	subnet_id               = module.network.postgresql_subnet_id
}

module "rabbitmq" {
	source                = "../../modules/rabbitmq"
	rabbitmq_name         = "${var.client}-${var.environment}-rabbitmq"
	location              = var.location
	resource_group_name   = var.resource_group_name
	subnet_id             = module.network.rabbitmq_subnet_id
}

module "rediscache" {
	source                = "../../modules/rediscache"
	redis_name            = "${var.client}-${var.environment}-redis"
	location              = var.location
	resource_group_name   = var.resource_group_name
	subnet_id             = module.network.redis_subnet_id
}
