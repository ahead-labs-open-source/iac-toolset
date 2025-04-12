module "s3_bucket_website_certificate" {
    source = "github.com/ahead-labs-open-source/iac-toolset.git//aws/certificate"

    providers = {
        aws.default = aws.default
        aws.global = aws.global
    }

    domain_name = var.dns_record_name
    subject_alternative_names = toset([var.dns_alternate_record_name])
    tags = var.tags
    domain_zone_id = var.dns_zone_id
}
