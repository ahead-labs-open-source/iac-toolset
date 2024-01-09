locals {
  record_tag = "DNS # record for zone ${var.dns_zone_name}"
}

resource "azurerm_dns_zone" "az_dns_zone" {
  name                = var.dns_zone_name
  resource_group_name = var.resource_group_name
  tags = var.tags
}
resource "azurerm_dns_a_record" "az_dns_zone_a_record" {
  for_each = { for k, v in var.dns_zone_a_records : k => v if v.alias == false }

  name                = each.key
  zone_name           = azurerm_dns_zone.az_dns_zone.name
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  records             = [each.value.value]
  tags = merge(var.tags, { "dns-record-type" = replace(local.record_tag, "#", "A") })
}
resource "azurerm_dns_cname_record" "az_dns_zone_cname_record" {
  for_each = { for k, v in var.dns_zone_cname_records : k => v if v.alias == false }

  name                = each.key
  zone_name           = azurerm_dns_zone.az_dns_zone.name
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  record              = each.value.value
  tags = merge(var.tags, { "dns-record-type" = replace(local.record_tag, "#", "CNAME") })
}
resource "azurerm_dns_mx_record" "az_dns_zone_mx_record" {
  for_each = var.dns_zone_mx_records

  name                = each.key
  zone_name           = azurerm_dns_zone.az_dns_zone.name
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  dynamic "record" {
    for_each = each.value.records
    content {
      preference = split(" ", record.value)[0]
      exchange   = split(" ", record.value)[1]
    }
  }
  tags = merge(var.tags, { "dns-record-type" = replace(local.record_tag, "#", "MX") })
}
resource "azurerm_dns_txt_record" "az_dns_zone_txt_record" {
  for_each = var.dns_zone_txt_records

  name                = each.key
  zone_name           = azurerm_dns_zone.az_dns_zone.name
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  dynamic "record" {
    for_each = each.value.records
    content {
      value = record.value
    }
  }
  tags = merge(var.tags, { "dns-record-type" = replace(local.record_tag, "#", "TXT") })
}
