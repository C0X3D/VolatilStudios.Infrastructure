output "vnet_id" {
  value = azurerm_virtual_network.main.id
}

output "aks_subnet_id" {
  value = azurerm_subnet.aks.id
}

output "postgresql_subnet_id" {
  value = azurerm_subnet.postgresql.id
}

output "redis_subnet_id" {
  value = azurerm_subnet.redis.id
}

output "rabbitmq_subnet_id" {
  value = azurerm_subnet.rabbitmq.id
}
