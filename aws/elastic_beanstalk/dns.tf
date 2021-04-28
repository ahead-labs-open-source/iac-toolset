// DNS records for the Elastic Beanstalk application

resource "aws_route53_record" "dns_record" {
    provider = aws.global

    name = "${var.application_domain}${var.application_environment_domain}.${var.root_dns_zone.name}"
    alias {
        name = aws_elastic_beanstalk_environment.eb_application_environment.cname
        zone_id = var.elastic_beanstalk_hosted_zone.id
        evaluate_target_health = true
    }
    type = "A"
    zone_id = var.root_dns_zone.id
}
