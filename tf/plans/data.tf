data "aws_secretsmanager_secret" "pd-secret" {
  arn = "arn:aws:secretsmanager:us-east-1:795345444371:secret:pd-secret-ILYbqF"
}

data "aws_secretsmanager_secret_version" "pd-secret-version" {
  secret_id = data.aws_secretsmanager_secret.pd-secret.id
}