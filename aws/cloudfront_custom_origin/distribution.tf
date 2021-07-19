resource "aws_cloudfront_distribution" "m_cloudfront_distribution" {
    provider = aws.global

    origin {
        domain_name = var.domain_name
        origin_id = "eb-${var.website_name}"

        custom_origin_config {
            http_port = 80
            https_port = 443
            origin_protocol_policy = "http-only"
            origin_ssl_protocols = [ "TLSv1.2" ]
        }
    }

    aliases = var.aliases

    default_cache_behavior {
        viewer_protocol_policy = "redirect-to-https"
        allowed_methods = ["GET","HEAD"]
        cached_methods = ["GET","HEAD"]
        default_ttl = 86400
        max_ttl = 31536000
        min_ttl = 0
        forwarded_values {
            cookies {
                forward = "all"
            }
            query_string = false
            headers = [ "*" ]
        }
        smooth_streaming = false
        compress = true
        target_origin_id = "eb-${var.website_name}"

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

    comment = var.domain_name
    default_root_object = var.default_root_object
    enabled = var.enabled
    is_ipv6_enabled = true
    tags = var.tags
}
