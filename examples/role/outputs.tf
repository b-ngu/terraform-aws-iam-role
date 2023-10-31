output "iam_role_name" {
  description = "The name of the IAM role"
  value       = module.iam_role.role_name
}

output "iam_role_arn" {
  description = "The ARN of the IAM role"
  value       = module.iam_role.role_arn
}

output "iam_policy_name" {
  description = "The name of the IAM policy"
  value       = module.iam_role.policy_name
}

output "iam_policy_arn" {
  description = "The ARN of the IAM policy"
  value       = module.iam_role.policy_arn
}
