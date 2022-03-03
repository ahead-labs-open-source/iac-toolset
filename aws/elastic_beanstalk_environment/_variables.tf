variable "application_name" {type = string}
variable "description" {
    type = string
    default = ""
}
variable "distribution_allowed_methods" {
    type = list
    default = ["GET","HEAD"]
}
variable "dns_zone_id" {}
variable "dns_record_name" {type = string}
variable "elasticbeanstalk_hosted_zone_id" {}
variable "environment_tier" {type = string}
variable "lambda_functions" {
    type = map
    default = {}
}
variable "settings" {type = map}
variable "stack_name" {type = string}
variable "tags" {type = map}

output "distribution_id" {
    value = module.eb_application_environment_distribution.cloudfront_distribution_id
}
output "endpoint_url" {
    value = aws_elastic_beanstalk_environment.eb_application_environment.endpoint_url
}
