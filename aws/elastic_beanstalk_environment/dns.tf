resource "aws_route53_record" "eb_application_environment_dns_record" {
    provider = aws.global

    name = var.dns_record_name
    alias {
        name = module.eb_application_environment_distribution.cloudfront_domain_name
        zone_id = module.eb_application_environment_distribution.cloudfront_domain_zone_id
        evaluate_target_health = true
    }
    type = "A"
    zone_id = var.dns_zone_id
}
