variable "resource_types" {
  type = map(any)
  default = {
    apim = {
      name = "API Management"
      tag  = "apim"
    }
    dns = {
      name = "DNS"
      tag  = "dns"
    }
    rg = {
      name = "Resource group"
      tag  = "rg"
    }
  }
}

output "resource_types" { value = var.resource_types }
