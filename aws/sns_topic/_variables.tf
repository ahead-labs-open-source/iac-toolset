variable "name" {
    type = string  
}
variable "display_name" {
    type = string  
}
variable "http_success_feedback_sample_rate" {
    type = number
    default = 100
}
variable "subscriptions" {
    type = map
    default = {}
}
variable "tags" {
    type = map
    default = {}
}
variable "allow_backup_notifications" {
    type = bool
    default = false
}
variable "allow_codestar_notifications" {
    type = bool
    default = false
}

output "sns_codepipeline_notifications_arn" {
    value = aws_sns_topic.sns_codepipeline_notifications.arn
}
