variable "business_unit" {
  #   type = map(any)
  #   default = {
  #     name = "Business core"
  #     tag  = "core"
  #   }
}
variable "client" {
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
  type    = string
  default = "01"
}
variable "location" {
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
  #   type = map(any)
  #   default = {
  #     name = "Resource group"
  #     tag  = "rg"
  #   }
}
variable "tags" {
  type    = map(any)
  default = {}
}

output "id" {
  value = azurerm_resource_group.az_resource_group.id
}
output "name" {
  value = azurerm_resource_group.az_resource_group.name  
}
