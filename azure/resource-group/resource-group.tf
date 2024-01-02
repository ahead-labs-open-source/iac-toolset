resource "azurerm_resource_group" "az_resource_group" {
  name     = "${var.resource_type.tag}-${var.client.tags.short}-${var.project.tags.short}-${var.business_unit.tag}-${var.location.tags.middle}-${var.environment.tags.short}-${var.instance}"
  location = var.location.tags.long
  tags     = var.tags
}
