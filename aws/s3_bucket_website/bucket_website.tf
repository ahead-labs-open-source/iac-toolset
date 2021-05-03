resource "aws_s3_bucket" "s3_bucket_website" {
    provider = aws.default

    bucket = var.bucket_name
    acl = var.bucket_acl
    tags = var.tags
    force_destroy = var.force_destroy

    versioning {
        enabled = var.bucket_versioning
    }

    website {
        index_document = var.website_index_document
    }
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_public_access_block" {
    provider = aws.default

    bucket = aws_s3_bucket.s3_bucket_website.id

    block_public_acls = false
    block_public_policy = false
    ignore_public_acls = false
    restrict_public_buckets = false
}
