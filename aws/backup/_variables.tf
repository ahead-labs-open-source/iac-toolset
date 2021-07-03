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
variable "lifecycle_cold_storage_after" {
    type = number
    default = 7
}
variable "lifecycle_delete_after" {
    type = number
    default = 97
}
variable "iam_role_arn" {
    type = string
}
variable "tags" {
    type = map
    default = {}
}
