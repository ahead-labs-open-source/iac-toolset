# Domain identity
resource "aws_ses_domain_identity" "ses_domain" {
    domain = var.domain
}

# DKIM
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

# DMARC
resource "aws_route53_record" "ses_domain_dmarc_record" {
    provider = aws.global

    zone_id = var.domain_zone_id
    name = "_dmarc"
    type = "TXT"
    ttl = "600"
    records = ["${var.email_dmarc_record}"]
}

# SPF
resource "aws_route53_record" "ses_domain_spf_record" {
    provider = aws.global

    zone_id = var.domain_zone_id
    name = "${var.email_from_domain}.${var.domain}"
    type = "TXT"
    ttl = "600"
    records = ["v=spf1 include:amazonses.com ~all"]
}

# MX
resource "aws_route53_record" "ses_domain_mail_from_mx" {
    provider = aws.global

    zone_id = var.domain_zone_id
    name = "${var.email_from_domain}.${var.domain}"
    records = ["10 feedback-smtp.eu-west-1.amazonses.com"]
    ttl = 600
    type = "MX"
}
