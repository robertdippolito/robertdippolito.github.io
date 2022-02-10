output "cf_distro_id" {
  value       = try(aws_cloudfront_distribution.cf.id, "")
  description = "ID of CloudFront distribution"
}

output "cf_arn" {
  value       = try(aws_cloudfront_distribution.cf.arn, "")
  description = "ARN of CloudFront distribution"
}

output "cf_origin_access_identity_path" {
  value       = try(aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path, "")
  description = "A shortcut to the full path for the origin access identity to use in CloudFront"
}

output "cf_origin_access_identity" {
  value       = try(aws_cloudfront_origin_access_identity.oai.id, "")
  description = "A shortcut to the full path for the origin access identity to use in CloudFront"
}