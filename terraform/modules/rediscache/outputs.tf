output "redis_id" {
  value = azurerm_redis_cache.main.id
}
output "redis_hostname" {
  value = azurerm_redis_cache.main.hostname
}
output "redis_primary_access_key" {
  value     = azurerm_redis_cache.main.primary_access_key
  sensitive = true
}

output "redis_private_ip" {
  value = azurerm_private_endpoint.redis.private_service_connection[0].private_ip_address
}
