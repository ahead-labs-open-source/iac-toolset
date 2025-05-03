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
  type    = string
  default = "01"
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
variable "resource_type" {
  description = "Azure resource type"
  #   type = map(any)
  #   default = {
  #     name = "Resource group"
  #     tag  = "rg"
  #   }
}
variable "tags" {
  description = "Tags of the resource"
  type    = map(any)
  default = {}
}

output "id" {
  value = azurerm_resource_group.az_resource_group.id
}
output "name" {
  value = azurerm_resource_group.az_resource_group.name  
}
