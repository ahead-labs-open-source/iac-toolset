variable "domain" {type = string}
variable "domain_zone_id" {type = string}
variable "email_dmarc_record" {
    type = string
    default = "v=DMARC1;p=none;adkim=r;aspf=r;"
}
variable "email_from_domain" {
    type = string
    default = "mail"
}
variable "email_reputation_metrics_enabled" {
    type = bool
    default = false
}
variable "email_subscriptions" {type = list}
variable "email_templates" {type = map}
variable "event_types" {type = list}
variable "events_enabled" {
    type = bool
    default = true
}
variable "tags" {
    type = map
    default = {}
}
variable "configuration_set_tls" {
    type = string
    default = "Optional"
}
