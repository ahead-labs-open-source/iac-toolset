variable "backup_vault_name" {
    type = string
}
variable "backup_plan_name" {
    type = string
}
variable "backup_rule_name" {
    type = string
}
variable "backup_assignment_name" {
    type = string
}
variable "backup_resources" {
    type = set(string)
    default = []
}
variable "cron_schedule" {
    type = string
}
variable "iam_role_arn" {
    type = string
}
variable "lifecycle_cold_storage_after" {
    type = number
    default = 7
}
variable "lifecycle_delete_after" {
    type = number
    default = 97
}
variable "notification_sns_topic_arn" {
    type = string
    default = null  
}
variable "notification_vault_events" {
    type = list
    default = [
        "BACKUP_JOB_STARTED",
        "BACKUP_JOB_COMPLETED",
        "COPY_JOB_STARTED",
        "COPY_JOB_SUCCESSFUL",
        "COPY_JOB_FAILED",
        "RESTORE_JOB_STARTED",
        "RESTORE_JOB_COMPLETED",
        "RECOVERY_POINT_MODIFIED"
    ]
}
variable "tags" {
    type = map
    default = {}
}
