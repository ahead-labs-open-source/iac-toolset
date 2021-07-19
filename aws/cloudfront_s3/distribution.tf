resource "aws_cloudfront_origin_access_identity" "m_cloudfront_origin_access_identity" {
    provider = aws.global

    comment = "access-identity-${var.website_name}"
}

resource "aws_cloudfront_distribution" "m_cloudfront_distribution" {
    provider = aws.global

    origin {
        domain_name = var.domain_name
        origin_id = "s3-${var.website_name}"

        s3_origin_config {
            origin_access_identity = aws_cloudfront_origin_access_identity.m_cloudfront_origin_access_identity.cloudfront_access_identity_path
        }
    }

    aliases = var.aliases

    default_cache_behavior {
        viewer_protocol_policy = "redirect-to-https"
        allowed_methods = ["GET","HEAD"]
        cached_methods = ["GET","HEAD"]
        default_ttl = 86400
        max_ttl = 31536000
        min_ttl = 1
        forwarded_values {
            cookies {
                forward = "none"
            }
            query_string = false
        }
        smooth_streaming = false
        compress = true
        target_origin_id = "s3-${var.website_name}"

        dynamic "lambda_function_association" {
            for_each = contains(var.lambda_functions.viewer-request.environment,terraform.workspace) == true ? toset([1]) : toset([])

            content {
                event_type = var.lambda_functions.viewer-request.event_type
                include_body = var.lambda_functions.viewer-request.include_body
                lambda_arn = var.lambda_functions.viewer-request.lambda_arn
            }
        }

        dynamic "lambda_function_association" {
            for_each = contains(var.lambda_functions.viewer-response.environment,terraform.workspace) == true ? toset([1]) : toset([])

            content {
                event_type = var.lambda_functions.viewer-response.event_type
                include_body = var.lambda_functions.viewer-response.include_body
                lambda_arn = var.lambda_functions.viewer-response.lambda_arn
            }
        }

        dynamic "lambda_function_association" {
            for_each = contains(var.lambda_functions.origin-request.environment,terraform.workspace) == true ? toset([1]) : toset([])

            content {
                event_type = var.lambda_functions.origin-request.event_type
                include_body = var.lambda_functions.origin-request.include_body
                lambda_arn = var.lambda_functions.origin-request.lambda_arn
            }
        }

        dynamic "lambda_function_association" {
            for_each = contains(var.lambda_functions.origin-response.environment,terraform.workspace) == true ? toset([1]) : toset([])

            content {
                event_type = var.lambda_functions.origin-response.event_type
                include_body = var.lambda_functions.origin-response.include_body
                lambda_arn = var.lambda_functions.origin-response.lambda_arn
            }
        }
    }

    viewer_certificate {
        acm_certificate_arn = var.acm_certificate_arn
        ssl_support_method = "sni-only"
        minimum_protocol_version = "TLSv1.2_2021"
    }

    restrictions {
      geo_restriction {
          restriction_type = "none"
      }
    }

    dynamic "custom_error_response" {
        for_each = var.custom_error_responses

        content {
            error_caching_min_ttl = custom_error_response.value.error_caching_min_ttl
            error_code = custom_error_response.value.error_code
            response_code = custom_error_response.value.response_code
            response_page_path = custom_error_response.value.response_page_path
        }
    }

    default_root_object = var.default_root_object
    enabled = var.enabled
    is_ipv6_enabled = true
    tags = var.tags
}

resource "aws_lambda_permission" "m_lambda_edge_permission_viewer_request" {
    count = contains(var.lambda_functions.viewer-request.environment,terraform.workspace) == true ? 1 : 0

    provider = aws.global

    statement_id = "m_lambda_edge_permission_viewer_request_permission_${terraform.workspace}"
    action = "lambda:GetFunction"
    function_name = var.lambda_functions.viewer-request.lambda_arn_bare
    principal = "edgelambda.amazonaws.com"
    qualifier = var.lambda_functions.viewer-request.version
}

resource "aws_lambda_permission" "m_lambda_edge_permission_viewer_response" {
    count = contains(var.lambda_functions.viewer-response.environment,terraform.workspace) == true ? 1 : 0

    provider = aws.global

    statement_id = "m_lambda_edge_permission_viewer_response_permission_${terraform.workspace}"
    action = "lambda:GetFunction"
    function_name = var.lambda_functions.viewer-response.lambda_arn_bare
    principal = "edgelambda.amazonaws.com"
    qualifier = var.lambda_functions.viewer-response.version
}

resource "aws_lambda_permission" "m_lambda_edge_permission_origin_request" {
    count = contains(var.lambda_functions.origin-request.environment,terraform.workspace) == true ? 1 : 0

    provider = aws.global

    statement_id = "m_lambda_edge_permission_origin_request_permission_${terraform.workspace}"
    action = "lambda:GetFunction"
    function_name = var.lambda_functions.origin-request.lambda_arn_bare
    principal = "edgelambda.amazonaws.com"
    qualifier = var.lambda_functions.origin-request.version
}

resource "aws_lambda_permission" "m_lambda_edge_permission_origin_response" {
    count = contains(var.lambda_functions.origin-response.environment,terraform.workspace) == true ? 1 : 0

    provider = aws.global

    statement_id = "m_lambda_edge_permission_origin_response_permission_${terraform.workspace}"
    action = "lambda:GetFunction"
    function_name = var.lambda_functions.origin-response.lambda_arn_bare
    principal = "edgelambda.amazonaws.com"
    qualifier = var.lambda_functions.origin-response.version
}
