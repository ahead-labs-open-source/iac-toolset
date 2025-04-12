module "bucket_codepipeline_artifacts" {
    source = "github.com/ahead-labs-open-source/iac-toolset.git//aws/s3_bucket"

    providers = {
        aws.default = aws.default
        aws.global = aws.global
        aws.createat = aws.default
    }
    
    bucket_name = var.pipeline_artifacts_bucket_name
    bucket_tags = var.tags
    force_destroy = true
}
