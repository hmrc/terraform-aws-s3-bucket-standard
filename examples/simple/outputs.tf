output "bucket_name" {
  value = module.s3_example.id
}

output "read_role_arn" {
  value = aws_iam_role.read.arn
}

output "write_role_arn" {
  value = aws_iam_role.write.arn
}

output "list_role_arn" {
  value = aws_iam_role.list.arn
}

output "admin_role_arn" {
  value = aws_iam_role.admin.arn
}