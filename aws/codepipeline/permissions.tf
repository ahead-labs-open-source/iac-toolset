resource "aws_iam_role" "codepipeline_pipeline_role" {
    provider = aws.default
    name = var.pipeline_role_name

    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codepipeline.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "codepipeline_pipeline_policy" {
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
                "codecommit:UploadArchive",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ]
        },
        {
            "Effect": "Allow",
            "Resource": [
                "${module.bucket_codepipeline_artifacts.arn}/*",
                "arn:aws:s3:::${var.stage_deploy_config_s3.BucketName}/*"
            ],
            "Action": [
                "s3:GetBucketLocation",
                "s3:GetObject",
                "s3:GetObjectAcl",
                "s3:ListBucket",
                "s3:PutObject",
                "s3:PutObjectAcl",
                "s3:PutObjectVersionAcl"
            ]
        },
        {
            "Effect": "Allow",
            "Resource": [
                "arn:aws:codebuild:${var.aws_region}:${var.aws_account_id}:project/${var.stage_build_config.ProjectName}"
            ],
            "Action": [
                "codebuild:BatchGetBuilds",
                "codebuild:StartBuild"
            ]
        }
    ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "codepipeline_pipeline_role_policy_attachment" {
    provider = aws.default

    role = aws_iam_role.codepipeline_pipeline_role.name
    policy_arn = aws_iam_policy.codepipeline_pipeline_policy.arn
}

resource "aws_iam_role_policy_attachment" "codepipeline_pipeline_role_eb_admin_policy_attachment" {
    provider = aws.default

    role = aws_iam_role.codepipeline_pipeline_role.name
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess-AWSElasticBeanstalk"
}
