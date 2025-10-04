output "postgresql_server_id" {
  value = azurerm_postgresql_flexible_server.main.id
}
output "postgresql_fqdn" {
  value = azurerm_postgresql_flexible_server.main.fqdn
}

output "postgresql_private_ip" {
  value = azurerm_private_endpoint.postgres.private_service_connection[0].private_ip_address
}
