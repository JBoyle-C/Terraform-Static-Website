output "record_fqdn" {
  value = aws_route53_record.web_alias.fqdn
}