/* Route53 DNS zones and records */

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
      configuration_aliases = [ aws.default, aws.global ]
    }
  }
}

variable "domain" {type = string}
variable "zone_id" {type = string}

variable "office_365_email" {type = bool}
variable "office_365_email_msid" {type = string}
