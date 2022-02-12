resource "aws_cloudfront_distribution" "cf" {
  enabled             = true
  aliases             = [var.endpoint]
  default_root_object = "index.html"

  origin {
    domain_name = aws_s3_bucket.blog_site_files.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.blog_site_files.bucket_regional_domain_name
    origin_path = "/public"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
    }
  }

  custom_error_response {
    error_code            = "404"
    response_code         = "200"
    response_page_path    = "/index.html"
    error_caching_min_ttl = 10
  }

  default_cache_behavior {
    allowed_methods        = var.allowed_methods
    cached_methods         = var.cached_methods
    target_origin_id       = aws_s3_bucket.blog_site_files.bucket_regional_domain_name
    viewer_protocol_policy = "redirect-to-https"

    lambda_function_association {
      event_type   = "origin-request"
      include_body = false
      lambda_arn   = "${aws_lambda_function.lambda.arn}:${aws_lambda_function.lambda.version}"
    }

    forwarded_values {
      headers      = []
      query_string = true

      cookies {
        forward = "all"
      }
    }
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.cert.arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2018"
  }

  tags = var.tags
}

resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = "OAI for ${var.endpoint}"
}