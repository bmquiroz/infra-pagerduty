provider "pagerduty" {
  token = var.pd-secret-value
}

# PagerDuty config for GPS
# Create GPS escalation policy
resource "pagerduty_escalation_policy" "prod-gps-escalation-policy" {
  name = "${var.environment}-gps-escalation-policy"
  num_loops = 3
  rule {
    escalation_delay_in_minutes = 15
    target {
      id   = data.pagerduty_user.pd_gbst_ep_user_email.id
      type = "user_reference"
    }
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create GPS service
resource "pagerduty_service" "prod-gps-service" {
  name = "${var.environment}-gps-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-gps-escalation-policy.id
  alert_creation    = "create_alerts_and_incidents"
  incident_urgency_rule {
    type    = "constant"
    urgency = "high"
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create GPS service integration
resource "pagerduty_service_integration" "prod-gps-service-integration-datadog" {
  name    = pagerduty_service.prod-gps-service.name
  service = pagerduty_service.prod-gps-service.id
  vendor  = data.pagerduty_vendor.datadog.id
}

# PagerDuty config for BRD
# Create BRD escalation policy
resource "pagerduty_escalation_policy" "prod-brd-escalation-policy" {
  name = "${var.environment}-brd-escalation-policy"
  num_loops = 3
  rule {
    escalation_delay_in_minutes = 15
    target {
      id   = data.pagerduty_user.pd_gbst_ep_user_email.id
      type = "user_reference"
    }
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create BRD service
resource "pagerduty_service" "prod-brd-service" {
  name = "${var.environment}-brd-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-brd-escalation-policy.id
  alert_creation    = "create_alerts_and_incidents"
  incident_urgency_rule {
    type    = "constant"
    urgency = "high"
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create BRD service integration
resource "pagerduty_service_integration" "prod-brd-service-integration-datadog" {
  name    = pagerduty_service.prod-brd-service.name
  service = pagerduty_service.prod-brd-service.id
  vendor  = data.pagerduty_vendor.datadog.id
}

# PagerDuty config for DEB
# Create DEB escalation policy
resource "pagerduty_escalation_policy" "prod-deb-escalation-policy" {
  name = "${var.environment}-deb-escalation-policy"
  num_loops = 3
  rule {
    escalation_delay_in_minutes = 15
    target {
      id   = data.pagerduty_user.pd_gbst_ep_user_email.id
      type = "user_reference"
    }
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create DEB service
resource "pagerduty_service" "prod-deb-service" {
  name = "${var.environment}-deb-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-deb-escalation-policy.id
  alert_creation    = "create_alerts_and_incidents"
  incident_urgency_rule {
    type    = "constant"
    urgency = "high"
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create DEB service integration
resource "pagerduty_service_integration" "prod-deb-service-integration-datadog" {
  name    = pagerduty_service.prod-deb-service.name
  service = pagerduty_service.prod-deb-service.id
  vendor  = data.pagerduty_vendor.datadog.id
}

# PagerDuty config for JAG
# Create JAG escalation policy
resource "pagerduty_escalation_policy" "prod-jag-escalation-policy" {
  name = "${var.environment}-jag-escalation-policy"
  num_loops = 3
  rule {
    escalation_delay_in_minutes = 15
    target {
      id   = data.pagerduty_user.pd_gbst_ep_user_email.id
      type = "user_reference"
    }
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create JAG service
resource "pagerduty_service" "prod-jag-service" {
  name = "${var.environment}-jag-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-jag-escalation-policy.id
  alert_creation    = "create_alerts_and_incidents"
  incident_urgency_rule {
    type    = "constant"
    urgency = "high"
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create JAG service integration
resource "pagerduty_service_integration" "prod-jag-service-integration-datadog" {
  name    = pagerduty_service.prod-jag-service.name
  service = pagerduty_service.prod-jag-service.id
  vendor  = data.pagerduty_vendor.datadog.id
}

# PagerDuty config for PPL
# Create PPL escalation policy
resource "pagerduty_escalation_policy" "prod-ppl-escalation-policy" {
  name = "${var.environment}-ppl-escalation-policy"
  num_loops = 3
  rule {
    escalation_delay_in_minutes = 15
    target {
      id   = data.pagerduty_user.pd_gbst_ep_user_email.id
      type = "user_reference"
    }
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create PPL service
resource "pagerduty_service" "prod-ppl-service" {
  name = "${var.environment}-ppl-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-ppl-escalation-policy.id
  alert_creation    = "create_alerts_and_incidents"
  incident_urgency_rule {
    type    = "constant"
    urgency = "high"
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create PPL service integration
resource "pagerduty_service_integration" "prod-ppl-service-integration-datadog" {
  name    = pagerduty_service.prod-ppl-service.name
  service = pagerduty_service.prod-ppl-service.id
  vendor  = data.pagerduty_vendor.datadog.id
}