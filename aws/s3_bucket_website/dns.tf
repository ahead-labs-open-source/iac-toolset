resource "aws_route53_record" "s3_bucket_website_dns_record" {
    provider = aws.global

    for_each = toset([var.dns_record_name, var.dns_alternate_record_name])

    name = each.value
    alias {
        name = module.s3_bucket_website_distribution.cloudfront_domain_name
        zone_id = module.s3_bucket_website_distribution.cloudfront_domain_zone_id
        evaluate_target_health = true
    }
    type = "A"
    zone_id = var.dns_zone_id
}
