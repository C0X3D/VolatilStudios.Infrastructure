output "rabbitmq_id" {
  value = azurerm_servicebus_namespace.main.id
}
output "rabbitmq_endpoint" {
  value = azurerm_servicebus_namespace.main.default_primary_connection_string
  sensitive = true
}

output "rabbitmq_private_ip" {
  value = azurerm_private_endpoint.sb.private_service_connection[0].private_ip_address
}
