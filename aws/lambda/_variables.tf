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
variable "runtime" {
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

output "arn" {
    value = aws_lambda_function.lambda_cloudfront_function.arn
}
output "qualified_arn" {
    value = aws_lambda_function.lambda_cloudfront_function.qualified_arn
}
output "version" {
    value = aws_lambda_function.lambda_cloudfront_function.version
}
