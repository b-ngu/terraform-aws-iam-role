provider "aws" {
  region = var.region
}

module "iam_role" {
  source             = "../../"

  contact     = var.contact
  environment = var.environment
  team        = var.team
  purpose     = var.purpose

  role_name          = "example-role"
  assume_role_policy = {
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Effect = "Allow",
        Sid    = ""
      }
    ]
  }
  policy_name    = "example-policy"
  policy_document = {
    Version = "2012-10-17",
    Statement = [
      {
        Action   = "s3:ListBucket",
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  }
  tags = {
    Terraform    = "true"
    Environment  = "dev"
  }
}
