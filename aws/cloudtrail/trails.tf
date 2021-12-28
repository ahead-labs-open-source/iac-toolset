resource "aws_cloudtrail" "trail" {
    provider = aws.default    
    for_each = var.cloudtrails

    name = "${each.value.name}-${terraform.workspace}-trail"
    s3_bucket_name = module.s3_bucket_trails.bucket
    s3_key_prefix = "${each.value.bucket_prefix}" 
    tags = var.bucket_tags

    event_selector {
      data_resource {
        type = "${each.value.event_selector_type}"
        values = "${var.event_selector_values}"
      }
      read_write_type = "${each.value.event_selector_read_write_type}"
    }
}
