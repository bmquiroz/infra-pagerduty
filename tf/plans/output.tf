output "pd-secret-value" {
  value = jsondecode(data.aws_secretsmanager_secret_version.pd-secret-version.secret_string)["pd-secret"]
  sensitive = true
}