# terraform-aws-iam-role

## Summary

Terraform module which creates AWS IAM role resources along with associated policies and trust relationships.

This module simplifies the process of creating IAM roles, making it more straightforward to manage AWS IAM roles and their permissions. IAM roles allow you to delegate permissions that grant access to AWS resources without having to share security credentials.

## Helpful AWS Documentation Links

- [IAM Roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html)
- [Understanding IAM Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html)
- [IAM JSON Policy Elements Reference](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements.html)

## Example Usage

```hcl
module "iam_role" {
  source  = "path_to_this_module"

  role_name           = "example-role"
  assume_role_policy  = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action    = "sts:AssumeRole",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Effect = "Allow",
      },
    ],
  })

  policies = [
    {
      policy_name        = "example-policy"
      policy_description = "A policy for my example role"
      policy_document    = jsonencode({
        Version = "2012-10-17",
        Statement = [
          {
            Action   = "s3:ListBucket",
            Effect   = "Allow",
            Resource = "*",
          },
        ],
      })
    },
  ]

  tags = {
    Terraform    = "true"
    Environment  = "dev"
  }
}
```

Replace `path_to_this_module` with the path to where you have this module.

## Tags

To configure any additional tags, set tags map in module definition

```hcl

module "iam_role" {
  source = "path_to_this_module"

  ...

  tags = {
    Project      = "MyProject"
    Environment  = "Production"
  }
}


```

## Examples

* [IAM Role](./examples/role)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=4.28 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >=4.28 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_region"></a> [region](#input_region) | The default region for the test. | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input_tags) | A map of tags to add to all resources. | `map(string)` | `{}` | no |
| <a name="input_contact"></a> [contact](#input_contact) | (Required) The contact for this resource. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input_environment) | (Required) The environment where this resource will live. | `string` | n/a | yes |
| <a name="input_team"></a> [team](#input_team) | (Required) The team responsible for this resource. | `string` | n/a | yes |
| <a name="input_purpose"></a> [purpose](#input_purpose) | (Required) The purpose for this resource. | `string` | n/a | yes |
| <a name="input_role_name"></a> [role_name](#input_role_name) | The name of the IAM role. | `string` | n/a | yes |
| <a name="input_assume_role_policy"></a> [assume_role_policy](#input_assume_role_policy) | The trust relationship policy document in JSON format. | `any` | n/a | yes |
| <a name="input_policy_name"></a> [policy_name](#input_policy_name) | The name of the IAM policy. | `string` | n/a | yes |
| <a name="input_policy_description"></a> [policy_description](#input_policy_description) | The description of the IAM policy. | `string` | `"A policy created by Terraform"` | no |
| <a name="input_policy_document"></a> [policy_document](#input_policy_document) | The policy document. This is a JSON formatted string. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_name"></a> [role_name](#output_role_name) | The name of the IAM role |
| <a name="output_role_arn"></a> [role_arn](#output_role_arn) | The ARN of the IAM role |
| <a name="output_policy_name"></a> [policy_name](#output_policy_name) | The name of the IAM policy |
| <a name="output_policy_arn"></a> [policy_arn](#output_policy_arn) | The ARN of the IAM policy |


<!-- END_TF_DOCS -->