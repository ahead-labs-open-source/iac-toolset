variable "log_group_name" {
    type = string
}
variable "log_group_retention_days" {
    type = number
    default = 7
}
variable "log_group_tags" {
    type = map
    default = {}
}

output "arn" {
    value = aws_cloudwatch_log_group.cloudwatch_builds_log_group.arn
}
output "name" {
    value = aws_cloudwatch_log_group.cloudwatch_builds_log_group.name
}
