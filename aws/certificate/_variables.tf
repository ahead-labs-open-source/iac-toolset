variable "domain_name" {type = string}
variable "subject_alternative_names" {type = set(string)}
variable "tags" {type = map}
variable "domain_zone_id" {type = string}

output "certificate_arn" {
    value = aws_acm_certificate.m_certificate.arn
}
