resource "aws_cloudfront_distribution" "s3_distribution" {
    origin {
        domain_name   = aws_s3_bucket.bucket.bucket_domain_name
        origin_id     = var.s3_origin_id 
    }

    enabled             = true
    is_ipv6_enabled     = true
    default_root_object = "index.html"


    default_cache_behavior {
        allowed_methods     = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
        cached_methods      = ["GET", "HEAD"]
        target_origin_id    = var.s3_origin_id

        forwarded_values {
            query_string = false

            cookies {
                forward = "none"
            }
        }
    
        viewer_protocol_policy  = "allow-all"
        min_ttl                 = 0
        default_ttl             = 3600
        max_ttl                 = 86400
    }

    restrictions {
        geo_restriction {
            restriction_type    = "whitelist"
            locations           = ["US", "CA", "GB", "DE"]
        }
    }

    viewer_certificate {
        cloudfront_default_certificate = true
    }
}