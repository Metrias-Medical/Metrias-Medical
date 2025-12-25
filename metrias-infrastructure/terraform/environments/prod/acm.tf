resource "aws_acm_certificate" "main" {
  domain_name       = "app.metriasmedical.com"
  validation_method = "DNS"

  tags = {
    Name = "metrias-prod-cert"
  }

  lifecycle {
    create_before_destroy = true
  }
}

output "acm_validation_records" {
  description = "DNS records to add to Cloudflare for certificate validation"
  value = {
    for dvo in aws_acm_certificate.main.domain_validation_options : dvo.domain_name => {
      name  = dvo.resource_record_name
      type  = dvo.resource_record_type
      value = dvo.resource_record_value
    }
  }
}
