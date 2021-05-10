resource "aws_rds_cluster" "rds_cluster" {
    availability_zones = var.cluster_availability_zones
    backup_retention_period = var.cluster_backup_retention_period
    cluster_identifier = var.cluster_identifier
    copy_tags_to_snapshot = var.cluster_copy_tags_to_snapshot
    database_name = var.cluster_database_name
    enabled_cloudwatch_logs_exports = var.cluster_enabled_cloudwatch_logs_exports
    engine = var.cluster_engine
    engine_mode = var.cluster_engine_mode
    engine_version = var.cluster_engine_version
    final_snapshot_identifier = var.cluster_snapshot_identifier
    master_password = var.cluster_master_password
    master_username = var.cluster_master_username
    preferred_backup_window = var.cluster_preferred_backup_window
    preferred_maintenance_window = var.cluster_preferred_maintenance_window
    tags = var.tags
}

resource "aws_rds_cluster_instance" "rds_cluster_instance" {
    count = var.instance_number
    cluster_identifier = aws_rds_cluster.rds_cluster.id
    copy_tags_to_snapshot = var.cluster_copy_tags_to_snapshot
    engine = aws_rds_cluster.rds_cluster.engine
    engine_version = aws_rds_cluster.rds_cluster.engine_version
    identifier = "${aws_rds_cluster.rds_cluster.cluster_identifier}-${count.index + 1}"
    instance_class = var.instance_class
    preferred_maintenance_window = aws_rds_cluster.rds_cluster.preferred_maintenance_window
    publicly_accessible = var.instance_publicly_accessible 
    tags = var.tags
}
