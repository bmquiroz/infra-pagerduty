# GPS outputs
output "gps-datadog-integration-id" {
  value = pagerduty_service_integration.prod-gps-service-integration-datadog.id
}

output "gps-datadog-integration-key" {
  value = pagerduty_service_integration.prod-gps-service-integration-datadog.integration_key
}

# BRD outputs
output "brd-datadog-integration-id" {
  value = pagerduty_service_integration.prod-brd-service-integration-datadog.id
}

output "brd-datadog-integration-key" {
  value = pagerduty_service_integration.prod-brd-service-integration-datadog.integration_key
}

# DEB outputs
output "deb-datadog-integration-id" {
  value = pagerduty_service_integration.prod-deb-service-integration-datadog.id
}

output "deb-datadog-integration-key" {
  value = pagerduty_service_integration.prod-deb-service-integration-datadog.integration_key
}

# JAG outputs
output "jag-datadog-integration-id" {
  value = pagerduty_service_integration.prod-jag-service-integration-datadog.id
}

output "jag-datadog-integration-key" {
  value = pagerduty_service_integration.prod-jag-service-integration-datadog.integration_key
}

# PPL outputs
output "ppl-datadog-integration-id" {
  value = pagerduty_service_integration.prod-ppl-service-integration-datadog.id
}

output "ppl-datadog-integration-key" {
  value = pagerduty_service_integration.prod-ppl-service-integration-datadog.integration_key
}