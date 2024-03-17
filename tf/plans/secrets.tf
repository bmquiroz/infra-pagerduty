locals {
  secrets = [
    "pagerduty/api_token"
  ]
}

resource "aws_secretsmanager_secret" "secrets" {
  for_each                = toset(local.secrets)
  name                    = each.key
  description             = data.sops_file.secrets.data["${each.key}.description"]
  recovery_window_in_days = 7
}

resource "aws_secretsmanager_secret_version" "secrets" {
  for_each      = toset(local.secrets)
  secret_id     = aws_secretsmanager_secret.secrets[each.key].id
  secret_string = data.sops_file.secrets.data["${each.key}.value"]
}
output "pagerduty_api_token" {
  value     = aws_secretsmanager_secret_version.secrets["pagerduty/api_token"].secret_string
  sensitive = true
}