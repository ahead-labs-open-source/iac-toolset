resource "aws_iam_role" "lambda_cloudfront_execution_role" {
    name = "${var.function_name}-execution-role"
    path = "/service-role/"
    tags = var.tags

    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": [
                    "lambda.amazonaws.com",
                    "edgelambda.amazonaws.com"
                ]
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy" "lambda_cloudfront_policy" {
    name = "${var.function_name}-policy"
    role = aws_iam_role.lambda_cloudfront_execution_role.id

    policy = jsonencode(
        {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Effect": "Allow",
                    "Action": "logs:CreateLogGroup",
                    "Resource": "arn:aws:logs:us-east-1:${data.aws_caller_identity.current.account_id}:*"
                },
                {
                    "Effect": "Allow",
                    "Action": [
                        "logs:CreateLogStream",
                        "logs:PutLogEvents"
                    ],
                    "Resource": [
                        "arn:aws:logs:us-east-1:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/${aws_lambda_function.lambda_cloudfront_function.id}:*"
                    ]
                }
            ]
        }
    )
}

resource "aws_lambda_function" "lambda_cloudfront_function" {
    provider = aws.createat
    
    description = var.function_description
    environment {
      variables = var.environment_variables
    }
    function_name = var.function_name
    handler = var.handler
    publish = true
    runtime = var.runtime
    role = aws_iam_role.lambda_cloudfront_execution_role.arn
    s3_bucket = var.source_code_s3_bucket
    s3_key = var.source_code_s3_object_key
    tags = var.tags
}
