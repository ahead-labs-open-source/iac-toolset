terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
      configuration_aliases = [ aws.default ]
    }
  }
}

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

resource "aws_s3_bucket" "s3_bucket" {
    provider = aws.default

    bucket = var.bucket_name
    acl = var.bucket_acl
    tags = var.bucket_tags
    force_destroy = var.force_destroy

    versioning {
        enabled = var.bucket_versioning
    }
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_public_access_block" {
    provider = aws.default

    bucket = aws_s3_bucket.s3_bucket.id

    block_public_acls = var.block_public_access_new_acls
    block_public_policy = var.block_public_access_policies
    ignore_public_acls = var.block_public_access_any_acls
    restrict_public_buckets = var.block_public_access_cross_accounts
}

output "arn" {
    value = aws_s3_bucket.s3_bucket.arn
}
output "bucket" {
    value = var.bucket_name
}
