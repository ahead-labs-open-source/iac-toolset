resource "aws_ses_domain_identity" "ses_domain" {
    domain = var.domain
}

resource "aws_ses_domain_dkim" "ses_domain_dkim_verification" {
    domain = aws_ses_domain_identity.ses_domain.domain
}

resource "aws_route53_record" "ses_domain_dkim_verification_record" {
    count = 3
    zone_id = var.domain_zone_id
    name = "${element(aws_ses_domain_dkim.ses_domain_dkim_verification.dkim_tokens, count.index)}._domainkey"
    type = "CNAME"
    ttl = "600"
    records = ["${element(aws_ses_domain_dkim.ses_domain_dkim_verification.dkim_tokens, count.index)}.dkim.amazonses.com"]
}
