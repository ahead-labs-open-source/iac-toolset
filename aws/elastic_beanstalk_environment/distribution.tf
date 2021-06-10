module "eb_application_environment_distribution" {
    source = "github.com/aheadlabs/terraform-modules.git//aws/cloudfront_custom_origin"

    providers = {
        aws.default = aws.default
        aws.global = aws.global
    }

    website_name = var.dns_record_name
    domain_name = aws_elastic_beanstalk_environment.eb_application_environment.endpoint_url
    aliases = toset([
        var.dns_record_name
    ])
    acm_certificate_arn = module.eb_application_environment_certificate.certificate_arn
    default_root_object = "index.html"
    enabled = true
    lambda_functions = var.lambda_functions
    tags = var.tags
}
