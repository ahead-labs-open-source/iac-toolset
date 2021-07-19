data "aws_caller_identity" "current" {
    provider = aws.default
}
data "aws_region" "current" {
    provider = aws.createat
}
