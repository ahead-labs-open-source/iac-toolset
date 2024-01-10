resource "azurerm_api_management" "az_api_management" {
    name                = "${var.resource_type.tag}-${var.client.tags.short}-${var.project.tags.short}-${var.business_unit.tag}-${var.location.tags.middle}-${var.environment.tags.short}-${var.instance}"
    location            = var.location.tags.long
    resource_group_name = var.resource_group_name
    publisher_name      = var.publisher.name
    publisher_email     = var.publisher.email
    sku_name            = var.sku_name
    tags                = var.tags 
}
