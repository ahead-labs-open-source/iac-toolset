variable "domain" {type = string}
variable "zone_id" {type = string}

variable "office_365_email" {
    type = bool
    default = false
}
variable "office_365_email_msid" {
    type = string
    default = ""
}

variable "google_workspace_email" {
    type = bool
    default = false
}

variable "google_workspace_site_verification" {
    type = string
    default = ""
}
