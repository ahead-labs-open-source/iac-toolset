variable "locations" {
  type = map(object({
    name = string
    tags = map(string)
  }))
  default = {
    westeurope = {
      name = "West Europe"
      tags = {
        long   = "westeurope"
        middle = "westeu"
        short  = "weu"
      }
    }
  }
}

output "locations" { value = var.locations }
