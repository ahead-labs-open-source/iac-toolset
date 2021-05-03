module "s3_bucket_website_distribution" {
    source = "github.com/aheadlabs/terraform-modules.git//aws/cloudfront_s3"

    providers = {
        aws.default = aws.default
        aws.global = aws.global
    }

    website_name = var.dns_record_name
    domain_name = aws_s3_bucket.s3_bucket_website.bucket_domain_name
    aliases = toset([
        var.dns_record_name,
        var.dns_alternate_record_name
    ])
    acm_certificate_arn = module.s3_bucket_website_certificate.certificate_arn
    default_root_object = "index.html"
    enabled = true
    tags = var.tags
}

resource "aws_s3_bucket_policy" "s3_bucket_website_distribution_policy" {
    provider = aws.default
    
    bucket = aws_s3_bucket.s3_bucket_website.id
    policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "${module.s3_bucket_website_distribution.origin_access_identity_arn}"
            },
            "Action": "s3:GetObject",
            "Resource": "${aws_s3_bucket.s3_bucket_website.arn}/*"
        }
    ]
}
POLICY
}
