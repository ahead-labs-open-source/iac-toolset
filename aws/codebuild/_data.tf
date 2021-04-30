data "aws_codecommit_repository" "codecommit_repository" {
    provider = aws.default
    repository_name = var.codecommit_repository
}
