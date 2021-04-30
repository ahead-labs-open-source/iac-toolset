variable "application_name" {type = string}
variable "application_description" {type = string}
variable "tags" {type = map}

output "application_name" {value = var.application_name}
output "application_description" {value = var.application_description}
output "tags" {value = var.tags}
