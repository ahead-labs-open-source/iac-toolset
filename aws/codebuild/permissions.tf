// Service roles for each build
resource "aws_iam_role" "codebuild_pipeline_role" {
    provider = aws.default

    name = var.service_role_name
    tags = var.tags    

    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
        "Effect": "Allow",
        "Principal": {
            "Service": "codebuild.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

// Role policies for each build
resource "aws_iam_policy" "codebuild_project_policy" {
    provider = aws.default
    name = var.policy_name
    description = var.policy_description
    tags = var.tags

    policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Resource": [
                "${module.cloudwatch_builds_log_group.arn}",                
                "${module.cloudwatch_builds_log_group.arn}:*"
            ],
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ]
        },
        {
            "Effect": "Allow",
            "Resource": [
                "${data.aws_codecommit_repository.codecommit_repository.arn}"
            ],
            "Action": [
                "codecommit:BatchDescribe*",
                "codecommit:BatchGet*",
                "codecommit:CancelUploadArchive",
                "codecommit:Get*",
                "codecommit:GitPull",
                "codecommit:Describe*",
                "codecommit:EvaluatePullRequestApprovalRules",
                "codecommit:List*",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ]
        },
        {
            "Effect": "Allow",
            "Resource": [
                "${module.bucket_codebuild_artifacts.arn}/*"
            ],
            "Action": [
                "s3:GetBucketLocation",
                "s3:GetObject",
                "s3:GetObjectAcl",
                "s3:ListBucket",
                "s3:PutObject",
                "s3:PutObjectAcl"
            ]
        },
        {
            "Effect": "Allow",
            "Resource": [
                "arn:aws:s3:::${var.product_id}-${terraform.workspace}-website/*",
                "arn:aws:s3:::${var.product_id}-${terraform.workspace}-website"
            ],
            "Action": [
                "s3:GetBucketLocation",
                "s3:GetObject",
                "s3:GetObjectAcl",
                "s3:ListBucket",
                "s3:PutObject",
                "s3:PutObjectAcl",
                "s3:PutObjectVersionAcl",
                "s3:DeleteObject"
            ]
        },
        {
            "Effect": "Allow",
            "Resource": [
                "arn:aws:s3:::${var.product_id}-${terraform.workspace}-pipeline-artifacts/*"
            ],
            "Action": [
                "s3:GetBucketLocation",
                "s3:GetObject",
                "s3:GetObjectAcl",
                "s3:ListBucket",
                "s3:PutObject",
                "s3:PutObjectAcl"
            ]
        }
    ]
}
POLICY
}

// Attach build policy to build role
resource "aws_iam_role_policy_attachment" "codebuild_pipeline_role_policy_attachment" {
    provider = aws.default

    role = aws_iam_role.codebuild_pipeline_role.name
    policy_arn = aws_iam_policy.codebuild_project_policy.arn
}
