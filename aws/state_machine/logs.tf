resource "aws_cloudwatch_log_group" "state_machine_log_group" {
    name = "${var.name}-state-machine-log-group"
    retention_in_days = var.logging.retention_in_days
    tags = var.tags
}
