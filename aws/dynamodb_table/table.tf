resource "aws_dynamodb_table" "dynamodb_table" {
    name = var.table_name
    hash_key = var.hash_key
    read_capacity = 5
    write_capacity = 5
    tags = var.tags

    dynamic "attribute" {
        for_each = var.attributes

        content {
            name = attribute.key
            type = attribute.value
        }
    }
}
