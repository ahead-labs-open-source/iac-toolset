// Build artifact buckets for each software product
module "bucket_codebuild_artifacts" {
    source = "github.com/aheadlabs/terraform-modules.git//s3_bucket"

    providers = {
        aws.default = aws.default
    }
    
    bucket_name = var.artifacts_bucket_name
    force_destroy = true
    bucket_tags = var.tags
}

// Build cache buckets for each software product
module "bucket_codebuild_cache" {
    source = "github.com/aheadlabs/terraform-modules.git//s3_bucket"

    providers = {
        aws.default = aws.default
    }
    
    bucket_name = var.cache_bucket_name
    force_destroy = true
    bucket_tags = var.tags
}
