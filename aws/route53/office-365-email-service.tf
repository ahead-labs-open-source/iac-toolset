// Generates mandatory DNS records for the Microsoft Office 365 e-mail service

resource "aws_route53_record" "dns_record_mx_o365" {
    count = var.office_365_email == true ? 1 : 0

    provider = aws.global

    zone_id = var.zone_id
    name = ""
    records = [ "10 ${replace(var.domain, ".", "-")}.mail.protection.outlook.com." ]
    ttl = 3600
    type = "MX"
}

resource "aws_route53_record" "dns_record_cname_o365" {
    count = var.office_365_email == true ? 1 : 0

    provider = aws.global

    zone_id = var.zone_id
    name = "autodiscover"
    records = [ "autodiscover.outlook.com." ]
    ttl = 3600
    type = "CNAME"
}

resource "aws_route53_record" "dns_record_txt_o365" {
    count = var.office_365_email == true ? 1 : 0
    
    provider = aws.global

    zone_id = var.zone_id
    name = ""
    records = [ 
        "MS=ms${var.office_365_email_msid}", 
        "v=spf1 include:spf.protection.outlook.com ${var.spf_custom} ~all" ]
    ttl = 3600
    type = "TXT"
}
