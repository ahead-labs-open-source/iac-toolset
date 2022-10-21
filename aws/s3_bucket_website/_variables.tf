variable "bucket_name" {
    type = string
}
variable "bucket_acl" {
    type = string
    default = "private"
}
variable "bucket_versioning" {
    type = bool
    default = false
}
variable "custom_error_responses" {type = map}
variable "description" {
    type = string
    default = ""
}
variable "dns_alternate_record_name" {type = string}
variable "dns_record_name" {type = string}
variable "dns_zone_id" {type = string}
variable "force_destroy" {
    type = bool
    default = false
}
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
variable "redirect_all_requests_to" {
    type = string
    default = null
}
variable "tags" {
    type = map
    default = {}
}
variable "website_index_document" {
    type = string
    default = null
}

output "distribution_id" {
    value = module.s3_bucket_website_distribution.cloudfront_distribution_id
}
