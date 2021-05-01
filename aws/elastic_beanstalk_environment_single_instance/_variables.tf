variable "application_name" {type = string}
variable "dns_zone_id" {}
variable "dns_record_name" {type = string}
variable "elasticbeanstalk_hosted_zone_id" {}
variable "environment_tier" {type = string}
variable "settings" {type = map}
variable "stack_name" {type = string}
variable "tags" {type = map}
