module "bucket_codepipeline_artifacts" {
    source = "github.com/aheadlabs/terraform-modules.git//aws/s3_bucket"

    providers = {
        aws.default = aws.default
        aws.global = aws.global
    }
    
    bucket_name = var.pipeline_artifacts_bucket_name
    bucket_tags = var.tags
    force_destroy = true
}
