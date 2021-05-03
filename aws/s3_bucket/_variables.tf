variable "bucket_name" {
    type = string
}
variable "bucket_acl" {
    type = string
    default = "private"
}
variable "bucket_tags" {
    type = map
    default = {}
}
variable "block_public_access_new_acls" {
    type = bool
    default = true
}
variable "block_public_access_any_acls" {
    type = bool
    default = true
}
variable "block_public_access_policies" {
    type = bool
    default = true
}
variable "block_public_access_cross_accounts" {
    type = bool
    default = true
}
variable "bucket_versioning" {
    type = bool
    default = false
}
variable "force_destroy" {
    type = bool
    default = false
}
variable "website_index_document" {
    type = set(string)
    default = []
}

output "arn" {
    value = aws_s3_bucket.s3_bucket.arn
}
output "bucket" {
    value = var.bucket_name
}
output "bucket_domain_name" {
    value = aws_s3_bucket.s3_bucket.bucket_domain_name
}
output "id" {
    value = aws_s3_bucket.s3_bucket.id
}
