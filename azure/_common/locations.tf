variable "locations" {
  type = map(object({
    name = string
    geography = string
    tags = map(string)
  }))
  default = {
    westeurope = {
      name = "West Europe"
      geography = "Netherlands"
      tags = {
        long   = "westeurope"
        middle = "westeu"
        short  = "weu"
      }
    }
    spaincentral = {
      name = "Spain central"
      geography = "Madrid, Spain"
      tags = {
        long   = "spaincentral"
        middle = "spain"
        short  = "es"
      }
    }
  }
}

output "locations" { value = var.locations }
