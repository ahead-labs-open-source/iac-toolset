variable "acm_certificate_arn" {type = string}
variable "aliases" {type = set(string)}
variable "default_root_object" {type = string}
variable "domain_name" {type = string}
variable "enabled" {type = bool}
variable "website_name" {type = string}
variable "tags" {type = map}

output "origin_access_identity_arn" {
    value = aws_cloudfront_origin_access_identity.m_cloudfront_origin_access_identity.iam_arn
}
