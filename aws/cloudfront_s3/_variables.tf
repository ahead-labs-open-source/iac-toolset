variable "acm_certificate_arn" {type = string}
variable "aliases" {type = set(string)}
variable "custom_error_responses" {type = map}
variable "default_root_object" {type = string}
variable "description" {
    type = string
    default = ""
}
variable "domain_name" {type = string}
variable "enabled" {type = bool}
variable "geo_restrictions_blacklist" {
    type = list
    default = null
}
variable "geo_restrictions_whitelist" {
    type = list
    default = null
}
variable "lambda_functions" {
    type = map
    default = {}
}
variable "website_name" {type = string}
variable "tags" {type = map}

output "aliases" {
    value = var.aliases
}
output "cloudfront_distribution_id" {
    value = aws_cloudfront_distribution.m_cloudfront_distribution.id
}
output "cloudfront_domain_name" {
    value = aws_cloudfront_distribution.m_cloudfront_distribution.domain_name
}
output "cloudfront_domain_zone_id" {
    value = aws_cloudfront_distribution.m_cloudfront_distribution.hosted_zone_id
}
output "origin_access_identity_arn" {
    value = aws_cloudfront_origin_access_identity.m_cloudfront_origin_access_identity.iam_arn
}
