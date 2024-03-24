provider "pagerduty" {
  token = var.pd_secret_value
}

# Create LoB escalation policy
resource "pagerduty_escalation_policy" "prod-dmg-escalation-policy" {
  name = "${var.environment}-dmg-escalation-policy"
  num_loops = 3
  teams = [var.pd_team]
  rule {
    escalation_delay_in_minutes = 15
    target {
      id   = data.pagerduty_user.ep-mgr.id
      type = "user_reference"
    }
    target {
      id   = var.pd_schedule
      type = "schedule_reference"
    }
    target {
      id   = var.pd_db_schedule
      type = "schedule_reference"
    }
    target {
      id   = var.pd_app_schedule
      type = "schedule_reference"
    }
  }
  rule {
    escalation_delay_in_minutes = 15
    target {
      id   = data.pagerduty_user.ep-mgr2.id
      type = "user_reference"
    }
  }
  lifecycle {
    ignore_changes = all
  }
}

# PagerDuty config for AEX
# Create AEX service
resource "pagerduty_service" "prod-aex-service" {
  name = "${var.environment}-aex-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-dmg-escalation-policy.id
  alert_creation    = "create_alerts_and_incidents"
  incident_urgency_rule {
    type    = "constant"
    urgency = "high"
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create AEX service integration
resource "pagerduty_service_integration" "prod-aex-service-integration-datadog" {
  name    = pagerduty_service.prod-aex-service.name
  service = pagerduty_service.prod-aex-service.id
  vendor  = data.pagerduty_vendor.datadog.id
}

# PagerDuty config for BCM
# Create BCM service
resource "pagerduty_service" "prod-bcm-service" {
  name = "${var.environment}-bcm-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-dmg-escalation-policy.id
  alert_creation    = "create_alerts_and_incidents"
  incident_urgency_rule {
    type    = "constant"
    urgency = "high"
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create BCM service integration
resource "pagerduty_service_integration" "prod-bcm-service-integration-datadog" {
  name    = pagerduty_service.prod-bcm-service.name
  service = pagerduty_service.prod-bcm-service.id
  vendor  = data.pagerduty_vendor.datadog.id
}

# PagerDuty config for BSM
# Create BSM service
resource "pagerduty_service" "prod-bsm-service" {
  name = "${var.environment}-bsm-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-dmg-escalation-policy.id
  alert_creation    = "create_alerts_and_incidents"
  incident_urgency_rule {
    type    = "constant"
    urgency = "high"
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create BSM service integration
resource "pagerduty_service_integration" "prod-bsm-service-integration-datadog" {
  name    = pagerduty_service.prod-bsm-service.name
  service = pagerduty_service.prod-bsm-service.id
  vendor  = data.pagerduty_vendor.datadog.id
}

# PagerDuty config for CDR
# Create CDR service
resource "pagerduty_service" "prod-cdr-service" {
  name = "${var.environment}-cdr-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-dmg-escalation-policy.id
  alert_creation    = "create_alerts_and_incidents"
  incident_urgency_rule {
    type    = "constant"
    urgency = "high"
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create CDR service integration
resource "pagerduty_service_integration" "prod-cdr-service-integration-datadog" {
  name    = pagerduty_service.prod-cdr-service.name
  service = pagerduty_service.prod-cdr-service.id
  vendor  = data.pagerduty_vendor.datadog.id
}

# PagerDuty config for IND
# Create IND service
resource "pagerduty_service" "prod-ind-service" {
  name = "${var.environment}-ind-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-dmg-escalation-policy.id
  alert_creation    = "create_alerts_and_incidents"
  incident_urgency_rule {
    type    = "constant"
    urgency = "high"
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create IND service integration
resource "pagerduty_service_integration" "prod-ind-service-integration-datadog" {
  name    = pagerduty_service.prod-ind-service.name
  service = pagerduty_service.prod-ind-service.id
  vendor  = data.pagerduty_vendor.datadog.id
}

# PagerDuty config for RSH
# Create RSH service
resource "pagerduty_service" "prod-rsh-service" {
  name = "${var.environment}-rsh-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-dmg-escalation-policy.id
  alert_creation    = "create_alerts_and_incidents"
  incident_urgency_rule {
    type    = "constant"
    urgency = "high"
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create RSH service integration
resource "pagerduty_service_integration" "prod-rsh-service-integration-datadog" {
  name    = pagerduty_service.prod-rsh-service.name
  service = pagerduty_service.prod-rsh-service.id
  vendor  = data.pagerduty_vendor.datadog.id
}

# PagerDuty config for SHM
# Create SHM service
resource "pagerduty_service" "prod-shm-service" {
  name = "${var.environment}-shm-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-dmg-escalation-policy.id
  alert_creation    = "create_alerts_and_incidents"
  incident_urgency_rule {
    type    = "constant"
    urgency = "high"
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create SHM service integration
resource "pagerduty_service_integration" "prod-shm-service-integration-datadog" {
  name    = pagerduty_service.prod-shm-service.name
  service = pagerduty_service.prod-shm-service.id
  vendor  = data.pagerduty_vendor.datadog.id
}

# PagerDuty config for SMD
# Create SMD service
resource "pagerduty_service" "prod-smd-service" {
  name = "${var.environment}-smd-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-dmg-escalation-policy.id
  alert_creation    = "create_alerts_and_incidents"
  incident_urgency_rule {
    type    = "constant"
    urgency = "high"
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create SMD service integration
resource "pagerduty_service_integration" "prod-smd-service-integration-datadog" {
  name    = pagerduty_service.prod-smd-service.name
  service = pagerduty_service.prod-smd-service.id
  vendor  = data.pagerduty_vendor.datadog.id
}

# PagerDuty config for RPA
# Create RPA service
resource "pagerduty_service" "prod-rpa-service" {
  name = "${var.environment}-rpa-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-dmg-escalation-policy.id
  alert_creation    = "create_alerts_and_incidents"
  incident_urgency_rule {
    type    = "constant"
    urgency = "high"
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create RPA service integration
resource "pagerduty_service_integration" "prod-rpa-service-integration-datadog" {
  name    = pagerduty_service.prod-rpa-service.name
  service = pagerduty_service.prod-rpa-service.id
  vendor  = data.pagerduty_vendor.datadog.id
}