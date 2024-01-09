variable "dns_zone_name" {
  description = "The name of the DNS zone"
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}
variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
}
variable "dns_zone_a_records" {
  description = "A records for the DNS zone"
  type        = map(any)
}
variable "dns_zone_cname_records" {
  description = "CNAME records for the DNS zone"
  type        = map(any)
}
variable "dns_zone_mx_records" {
  description = "MX records for the DNS zone"
  type        = map(any)
}
variable "dns_zone_txt_records" {
  description = "TXT records for the DNS zone"
  type        = map(any)
}

output "dns_zone_name" {
  value = azurerm_dns_zone.az_dns_zone.id
}
output "name_servers" {
  value = azurerm_dns_zone.az_dns_zone.name_servers  
}
