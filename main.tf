resource "aws_iam_role" "this" {
  name               = var.role_name
  assume_role_policy = jsonencode(var.assume_role_policy)
  tags = merge(
    { "Name" = "${local.resource_prefix}-role" },
    var.tags,
  )
}

resource "aws_iam_role_policy_attachment" "this" {
  policy_arn = aws_iam_policy.this.arn
  role       = aws_iam_role.this.name
}

resource "aws_iam_policy" "this" {
  name        = var.policy_name
  description = var.policy_description
  policy      = jsonencode(var.policy_document)
}
