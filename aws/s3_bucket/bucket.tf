resource "aws_s3_bucket" "s3_bucket" {
    provider = aws.default

    bucket = var.bucket_name
    acl = var.bucket_acl
    tags = var.bucket_tags
    force_destroy = var.force_destroy

    versioning {
        enabled = var.bucket_versioning
    }

    dynamic "website" {
        for_each = var.website_index_document
        content {
            index_document = website.value
        }
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

resource "aws_s3_bucket_policy" "web_hosting_bucket_policy" {
    provider = aws.default
    count = var.website_cloudfront_origin_access_identity_arn != null ? 1 : 0
    
    bucket = aws_s3_bucket.s3_bucket.id
    policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "${var.website_cloudfront_origin_access_identity_arn}"
            },
            "Action": "s3:GetObject",
            "Resource": "${aws_s3_bucket.s3_bucket.arn}/*"
        }
    ]
}
POLICY
}
