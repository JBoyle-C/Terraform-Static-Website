resource "aws_acm_certificate" "ssl_cert" {
    domain_name = var.domain_name
    validation_method = "DNS"

    tags = {
        Name = var.domain_name
    }

    lifecycle {
        create_before_destroy = true
    }
    # NOTE: We're skipping validation to simulate in this project
    # Normally you'd use aws_route53_record here to verify ownership
}