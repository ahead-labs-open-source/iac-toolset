resource "aws_ses_template" "advanced_registration_ses_template" {
    for_each = var.email_templates

    name = each.value.name
    subject = each.value.subject
    html = each.value.html
    text = each.value.text
}
