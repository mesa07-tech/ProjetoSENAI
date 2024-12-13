output "web_acl_arn" {
  description = "ARN do Web ACL"
      value       = aws_wafv2_web_acl.waf.arn
}

output "web_acl_id" {
  description = "ID do Web ACL"
  value       = aws_wafv2_web_acl.waf.id
}