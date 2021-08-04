data "aws_caller_identity" "current" {
    provider = aws.default
}
data "aws_codecommit_repository" "codecommit_repository" {
    provider = aws.default
    repository_name = var.codecommit_repository
}
data "aws_region" "current" {
    provider = aws.default
}
