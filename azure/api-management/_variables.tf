variable "business_unit" {
  description = "Business unit of the resource"
  #   type = map(any)
  #   default = {
  #     name = "Business core"
  #     tag  = "core"
  #   }
}
variable "client" {
  description = "Client of the resource"
  #   type = map(any)
  #   default = {
  #     aheadlabs = {
  #       name = "Ahead Labs"
  #       tags = {
  #         long  = "aheadlabs"
  #         short = "ahl"
  #       }
  #     }
  #   }
}
variable "environment" {
  description = "Environment of the resource"
  #   type = map(any)
  #   default = {
  #     name = "Production"
  #     tags = {
  #       long  = "production"
  #       short = "prod"
  #     }
  #   }
}
variable "instance" {
  description = "Instance of the resource, defaults to 01"
  type        = string
  default     = "01"
}
variable "location" {
  description = "Location of the resource"
  #   type = map(any)
  #   default = {
  #     name = "West Europe"
  #     tags = {
  #       long  = "westeurope"
  #       short = "weu"
  #     }
  #   }
}
variable "project" {
  description = "Project of the resource"
  #   type = map(any)
  #   default = {
  #     name = "API"
  #     tags = {
  #       long  = "api"
  #       short = "api"
  #     }
  #   }
}
variable "publisher" {
  description = "Publisher of the API Management Service"
  #   type = map(any)
  #   default = {
  #     name = "John Doe"
  #     email = "me@example.com"
  #   }
}
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}
variable "resource_type" {
  description = "Azure resource type"
  #   type = map(any)
  #   default = {
  #     name = "Resource group"
  #     tag  = "rg"
  #   }
}
variable "sku_name" {
  description = "The SKU name of the API Management Service"
  type        = string
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management#sku_name
}
variable "tags" {
  description = "Tags of the resource"
  type        = map(any)
  default     = {}
}

output "id" {
  description = "The ID of the API Management Service."
  value       = azurerm_api_management.az_api_management.id
}
output "developer_portal_url" {
  description = "The developer portal URL of the API Management Service."
  value       = azurerm_api_management.az_api_management.developer_portal_url
}
output "gateway_url" {
  description = "The gateway URL of the API Management Service."
  value       = azurerm_api_management.az_api_management.gateway_url
}
output "gateway_regional_url" {
  description = "The regional gateway URL of the API Management Service."
  value       = azurerm_api_management.az_api_management.gateway_regional_url
}
output "management_api_url" {
  description = "The management API URL of the API Management Service."
  value       = azurerm_api_management.az_api_management.management_api_url
}
output "name" {
  description = "The name of the API Management Service."
  value       = azurerm_api_management.az_api_management.name
}
output "portal_url" {
  description = "The portal URL of the API Management Service."
  value       = azurerm_api_management.az_api_management.portal_url
}
output "private_ip_addresses" {
  description = "The private IP addresses of the API Management Service."
  value       = azurerm_api_management.az_api_management.private_ip_addresses
}
output "public_ip_addresses" {
  description = "The public IP addresses of the API Management Service."
  value       = azurerm_api_management.az_api_management.public_ip_addresses
}
output "scm_url" {
  description = "The SCM URL of the API Management Service."
  value       = azurerm_api_management.az_api_management.scm_url
}
