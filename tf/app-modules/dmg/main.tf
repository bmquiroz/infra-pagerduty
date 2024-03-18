provider "pagerduty" {
  token = var.pd_secret_value
}

# PagerDuty config for AEX
# Create AEX escalation policy
resource "pagerduty_escalation_policy" "prod-aex-escalation-policy" {
  name = "${var.environment}-aex-escalation-policy"
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
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create AEX service
resource "pagerduty_service" "prod-aex-service" {
  name = "${var.environment}-aex-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-aex-escalation-policy.id
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
# Create BCM escalation policy
resource "pagerduty_escalation_policy" "prod-bcm-escalation-policy" {
  name = "${var.environment}-bcm-escalation-policy"
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
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create BCM service
resource "pagerduty_service" "prod-bcm-service" {
  name = "${var.environment}-bcm-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-bcm-escalation-policy.id
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
# Create BSM escalation policy
resource "pagerduty_escalation_policy" "prod-bsm-escalation-policy" {
  name = "${var.environment}-bsm-escalation-policy"
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
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create BSM service
resource "pagerduty_service" "prod-bsm-service" {
  name = "${var.environment}-bsm-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-bsm-escalation-policy.id
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
# Create CDR escalation policy
resource "pagerduty_escalation_policy" "prod-cdr-escalation-policy" {
  name = "${var.environment}-cdr-escalation-policy"
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
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create CDR service
resource "pagerduty_service" "prod-cdr-service" {
  name = "${var.environment}-cdr-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-cdr-escalation-policy.id
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
# Create IND escalation policy
resource "pagerduty_escalation_policy" "prod-ind-escalation-policy" {
  name = "${var.environment}-ind-escalation-policy"
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
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create IND service
resource "pagerduty_service" "prod-ind-service" {
  name = "${var.environment}-ind-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-ind-escalation-policy.id
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
# Create RSH escalation policy
resource "pagerduty_escalation_policy" "prod-rsh-escalation-policy" {
  name = "${var.environment}-rsh-escalation-policy"
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
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create RSH service
resource "pagerduty_service" "prod-rsh-service" {
  name = "${var.environment}-rsh-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-rsh-escalation-policy.id
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
# Create SHM escalation policy
resource "pagerduty_escalation_policy" "prod-shm-escalation-policy" {
  name = "${var.environment}-shm-escalation-policy"
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
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create SHM service
resource "pagerduty_service" "prod-shm-service" {
  name = "${var.environment}-shm-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-shm-escalation-policy.id
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
# Create SMD escalation policy
resource "pagerduty_escalation_policy" "prod-smd-escalation-policy" {
  name = "${var.environment}-smd-escalation-policy"
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
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create SMD service
resource "pagerduty_service" "prod-smd-service" {
  name = "${var.environment}-smd-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-smd-escalation-policy.id
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
# Create RPA escalation policy
resource "pagerduty_escalation_policy" "prod-rpa-escalation-policy" {
  name = "${var.environment}-rpa-escalation-policy"
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
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create RPA service
resource "pagerduty_service" "prod-rpa-service" {
  name = "${var.environment}-rpa-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-rpa-escalation-policy.id
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