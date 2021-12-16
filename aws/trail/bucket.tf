module "s3_bucket_trails" {
    source = "github.com/aheadlabs/terraform-modules.git//aws/s3_bucket"

    providers = {
        aws.default = aws.default
        aws.global = aws.global
        aws.createat = aws.default
    }

    bucket_name = var.bucket_name
    bucket_acl = var.bucket_acl
    bucket_tags = var.bucket_tags
    force_destroy = var.force_destroy

    bucket_versioning = var.bucket_versioning
}

resource "aws_s3_bucket_policy" "s3_bucket_trails_distribution_policy" {
    provider = aws.default
    
    bucket = module.s3_bucket_trails.id
    policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "${module.s3_bucket_trails.arn}"
        },
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "${module.s3_bucket_trails.arn}/*"
        }
    ]
}
POLICY
}
