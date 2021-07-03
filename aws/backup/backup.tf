resource "aws_backup_vault" "backup_vault" {
    name = var.backup_vault_name
    tags = var.tags
}

resource "aws_backup_plan" "backup_plan" {
    name = var.backup_plan_name
    tags = var.tags

    rule {
        rule_name = var.backup_rule_name
        target_vault_name = aws_backup_vault.backup_vault.name
        schedule = var.cron_schedule

        lifecycle {
            cold_storage_after = var.lifecycle_cold_storage_after
            delete_after = var.lifecycle_delete_after
        }
    }
}

resource "aws_backup_selection" "backup_selection" {
    iam_role_arn = var.iam_role_arn
    name = var.backup_assignment_name
    plan_id = aws_backup_plan.backup_plan.id

    resources = var.backup_resources
}
