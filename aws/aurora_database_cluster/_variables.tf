variable "cluster_availability_zones" {type = set(string)}
variable "cluster_backup_retention_period" {type = number}
variable "cluster_enabled_cloudwatch_logs_exports" {type = set(string)}
variable "cluster_copy_tags_to_snapshot" {type = bool}
variable "cluster_database_name" {type = string}
variable "cluster_engine" {type = string}
variable "cluster_engine_mode" {type = string}
variable "cluster_engine_version" {type = string}
variable "cluster_identifier" {type = string}
variable "cluster_master_password" {type = string}
variable "cluster_master_username" {type = string}
variable "cluster_preferred_backup_window" {type = string}
variable "cluster_preferred_maintenance_window" {type = string}
variable "cluster_snapshot_identifier" {type = string}

variable "instance_class" {type = string}
variable "instance_number" {type = string}
variable "instance_publicly_accessible" {type = bool}

variable "tags" {type = map}


output "cluster_identifier" {
    value = aws_rds_cluster.rds_cluster.cluster_identifier
}
