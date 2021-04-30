resource "aws_acm_certificate" "m_certificate" {
    provider = aws.global

    domain_name = var.domain_name
    subject_alternative_names = var.subject_alternative_names
    validation_method = "DNS"
    tags = var.tags

    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_route53_record" "m_dns_record_cname_certificate_validation" {
    provider = aws.global

    for_each = {
        for dvo in aws_acm_certificate.m_certificate.domain_validation_options : dvo.domain_name => {
            name   = dvo.resource_record_name
            record = dvo.resource_record_value
            type   = dvo.resource_record_type
        }
    }

    zone_id = var.domain_zone_id
    name = each.value.name
    records = [ each.value.record ]
    ttl = 3600
    type = each.value.type
}
