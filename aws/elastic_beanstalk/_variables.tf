variable "application_name" {type = string}
variable "application_description" {type = string}
variable "application_domain" {type = string}
variable "application_environment_domain" {type = string}
variable "elastic_beanstalk_hosted_zone" {}
variable "environment_tier" {
    type = string
    default = "WebServer"
}
variable "root_dns_zone" {}
variable "service_role_name" {type = string}
variable "settings" {type = map}
variable "stack_name" {type = string}
variable "tags" {type = map}
