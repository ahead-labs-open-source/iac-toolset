resource "aws_route53_record" "eb_application_environment_dns_record" {
    provider = aws.global

    name = var.dns_record_name
    alias {
        name = aws_elastic_beanstalk_environment.eb_application_environment.cname
        zone_id = var.elasticbeanstalk_hosted_zone_id
        evaluate_target_health = true
    }
    type = "A"
    zone_id = var.dns_zone_id
}
