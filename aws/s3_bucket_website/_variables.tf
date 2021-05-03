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
variable "dns_alternate_record_name" {type = string}
variable "dns_record_name" {type = string}
variable "dns_zone_id" {type = string}
variable "force_destroy" {
    type = bool
    default = false
}
variable "tags" {
    type = map
    default = {}
}
variable "website_index_document" {
    type = string
    default = "index.html"
}
