# output "pd-secret-value" {
#   value = jsondecode(data.aws_secretsmanager_secret_version.pd-secret-version.secret_string)["pd-secret"]
#   sensitive = true
# }

output "gps-datadog-integration-id" {
  value = module.pd-gbst-prod.gps-datadog-integration-id
}

output "gps-datadog-integration-key" {
  value = module.pd-gbst-prod.gps-datadog-integration-key
}

output "brd-datadog-integration-id" {
  value = module.pd-gbst-prod.brd-datadog-integration-id
}

output "brd-datadog-integration-key" {
  value = module.pd-gbst-prod.brd-datadog-integration-key
}

# DEB outputs
output "deb-datadog-integration-id" {
  value = module.pd-gbst-prod.deb-datadog-integration-id
}

output "deb-datadog-integration-key" {
  value = module.pd-gbst-prod.deb-datadog-integration-key
}

# JAG outputs
output "jag-datadog-integration-id" {
  value = module.pd-gbst-prod.jag-datadog-integration-id
}

output "jag-datadog-integration-key" {
  value = module.pd-gbst-prod.jag-datadog-integration-key
}

# PPL outputs
output "ppl-datadog-integration-id" {
  value = module.pd-gbst-prod.ppl-datadog-integration-id
}

output "ppl-datadog-integration-key" {
  value = module.pd-gbst-prod.ppl-datadog-integration-key
}