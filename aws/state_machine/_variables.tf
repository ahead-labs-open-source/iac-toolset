variable "definition" {
    type = string
}
variable "logging" {
    type = map
    default = {}
}
variable "name" {
    type = string
}
variable "role_inline_policy" {
    type = string
}
variable "tags" {
    type = map
    default = {}
}
variable "type" {
    type = string
}

/* OUTPUT VARIABLES */

output "cloudwatch_arn" {
    value = aws_cloudwatch_log_group.state_machine_log_group.arn
}
