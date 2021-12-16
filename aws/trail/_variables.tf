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
variable "bucket_acl" {
    type = string
    default = "private"
}
variable "bucket_name" {
    type = string
}
variable "bucket_tags" {
    type = map
    default = {}
}
variable "bucket_versioning" {
    type = bool
    default = false
}
variable "force_destroy" {
    type = bool
    default = false
}
variable "trails" {
    type = map
    default = {}
}
