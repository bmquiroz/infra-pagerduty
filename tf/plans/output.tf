# output "pd-secret-value" {
#   value = jsondecode(data.aws_secretsmanager_secret_version.pd-secret-version.secret_string)["pd-secret"]
#   sensitive = true
# }

# output "gps-datadog-integration-key" {
#   value = pagerduty_service_integration.prod-gps-service-integration-datadog.integration_key
# }