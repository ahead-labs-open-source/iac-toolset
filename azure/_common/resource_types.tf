variable "resource_types" {
  type = map(any)
  default = {
    rg = {
      name = "Resource group"
      tag  = "rg"
    }
  }
}

output "resource_types" { value = var.resource_types }
