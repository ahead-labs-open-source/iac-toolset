resource "aws_iam_role" "lambda_execution_role" {
    count = var.assume_role_policy == "" ? 1 : 0
    name = "lambda-${var.function_name}-execution-role"
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
                    "lambda.amazonaws.com"
                ]
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_iam_role" "lambda_execution_role_custom" {
    count = var.assume_role_policy == "" ? 0 : 1
    name = "lambda-${var.function_name}-execution-role"
    path = "/service-role/"
    tags = var.tags

    assume_role_policy = var.assume_role_policy
}

resource "aws_iam_role_policy" "lambda_log_policy" {
    name = "lambda-${var.function_name}-log-policy"
    role = aws_iam_role.lambda_execution_role.id
    provider = aws.createat

    policy = jsonencode(
        {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Effect": "Allow",
                    "Action": "logs:CreateLogGroup",
                    "Resource": "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:*"
                },
                {
                    "Effect": "Allow",
                    "Action": [
                        "logs:CreateLogStream",
                        "logs:PutLogEvents"
                    ],
                    "Resource": [
                        "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/${aws_lambda_function.lambda_function.id}:*"
                    ]
                }
            ]
        }
    )
}

resource "aws_iam_role_policy" "lambda_custom_policy" {
    count = var.policy == "" ? 0 : 1

    name = "lambda-${var.function_name}-custom-policy"
    role = var.assume_role_policy == "" ? aws_iam_role.lambda_execution_role[0].id : aws_iam_role.lambda_execution_role_custom[0].id

    policy = var.policy
}

resource "aws_lambda_function" "lambda_function" {
    provider = aws.createat
    
    description = var.function_description
    function_name = var.function_name
    handler = var.handler
    publish = false
    runtime = var.runtime
    role = var.assume_role_policy == "" ? aws_iam_role.lambda_execution_role[0].id : aws_iam_role.lambda_execution_role_custom[0].id
    s3_bucket = var.source_code_s3_bucket
    s3_key = var.source_code_s3_object_key
    tags = var.tags
    timeout = var.timeout
}

resource "aws_lambda_permission" "lambda_allow_sns" {
    count = var.sns_topic_arn_triggered_by == "" ? 0 : 1
    action        = "lambda:InvokeFunction"
    function_name = var.function_name
    principal     = "sns.amazonaws.com"
    source_arn    = var.sns_topic_arn_triggered_by
    statement_id = "lambda-allow-sns-permission"
}
