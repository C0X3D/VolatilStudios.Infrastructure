resource "azurerm_servicebus_namespace" "main" {
  name                = var.rabbitmq_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
}

resource "azurerm_private_endpoint" "sb" {
  name                = "${var.rabbitmq_name}-pe"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  private_service_connection {
    name                           = "${var.rabbitmq_name}-psc"
    private_connection_resource_id  = azurerm_servicebus_namespace.main.id
    is_manual_connection           = false
    subresource_names              = ["namespace"]
  }
}
