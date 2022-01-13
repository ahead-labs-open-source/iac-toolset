resource "aws_ses_domain_identity" "ses_domain_moovidy_com" {
    domain = var.domain
}

resource "aws_route53_record" "ses_domain_moovidy_com_verification_record" {
    zone_id = var.domain_zone_id
    name = "_amazonses.${aws_ses_domain_identity.ses_domain_moovidy_com.id}"
    type = "TXT"
    ttl = "600"
    records = [ aws_ses_domain_identity.ses_domain_moovidy_com.verification_token ]
}

resource "aws_ses_domain_identity_verification" "ses_domain_moovidy_com_verification" {
    domain = aws_ses_domain_identity.ses_domain_moovidy_com.id
}
