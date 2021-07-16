variable "handler" {
    type = string
    default = "index.handler"
}
variable "function_name" {
    type = string
}
variable "function_description" {
    type = string
}
variable "policy" {
    type = string
}
variable "runtime" {
    type = string
}
variable "sns_topic_arn_trigerred_by" {
    type = string
}
variable "source_code_s3_bucket" {
    type = string
}
variable "source_code_s3_object_key" {
    type = string
}
variable "tags" {
    type = map
    default = {}
}
variable "timeout" {
    type = number
    default = 30
}

output "arn" {
    value = aws_lambda_function.lambda_function.arn
}
output "qualified_arn" {
    value = aws_lambda_function.lambda_function.qualified_arn
}
output "version" {
    value = aws_lambda_function.lambda_function.version
}
