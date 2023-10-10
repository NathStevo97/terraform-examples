resource "azurerm_resource_group" "redis-rg" {
  name     = "${var.prefix}-redis-rg"
  location = var.region
}

resource "azurerm_redis_cache" "redis" {
  name                = "${var.prefix}-redis"
  location            = azurerm_resource_group.redis-rg.location
  resource_group_name = azurerm_resource_group.redis-rg.name
  capacity            = 2
  family              = "C"
  sku_name            = "Standard"
  enable_non_ssl_port = false
  minimum_tls_version = "1.2"

  redis_configuration {
  }
}