provider "pagerduty" {
  token = var.pd_secret_value
}

# PagerDuty config for ARI
# Create ARI escalation policy
resource "pagerduty_escalation_policy" "prod-ari-escalation-policy" {
  name = "${var.environment}-ari-escalation-policy"
  num_loops = 3
  teams = [var.pd_team]
  rule {
    escalation_delay_in_minutes = 15
    target {
      id   = data.pagerduty_user.ep-mgr.id
      type = "user_reference"
    }
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create ARI service
resource "pagerduty_service" "prod-ari-service" {
  name = "${var.environment}-ari-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-ari-escalation-policy.id
  alert_creation    = "create_alerts_and_incidents"
  incident_urgency_rule {
    type    = "constant"
    urgency = "high"
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create ARI service integration
resource "pagerduty_service_integration" "prod-ari-service-integration-datadog" {
  name    = pagerduty_service.prod-ari-service.name
  service = pagerduty_service.prod-ari-service.id
  vendor  = data.pagerduty_vendor.datadog.id
}

# PagerDuty config for CTR
# Create CTR escalation policy
resource "pagerduty_escalation_policy" "prod-ctr-escalation-policy" {
  name = "${var.environment}-ctr-escalation-policy"
  num_loops = 3
  teams = [var.pd_team]
  rule {
    escalation_delay_in_minutes = 15
    target {
      id   = data.pagerduty_user.ep-mgr.id
      type = "user_reference"
    }
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create CTR service
resource "pagerduty_service" "prod-ctr-service" {
  name = "${var.environment}-ctr-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-ctr-escalation-policy.id
  alert_creation    = "create_alerts_and_incidents"
  incident_urgency_rule {
    type    = "constant"
    urgency = "high"
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create CTR service integration
resource "pagerduty_service_integration" "prod-ctr-service-integration-datadog" {
  name    = pagerduty_service.prod-ctr-service.name
  service = pagerduty_service.prod-ctr-service.id
  vendor  = data.pagerduty_vendor.datadog.id
}

# PagerDuty config for EMA
# Create EMA escalation policy
resource "pagerduty_escalation_policy" "prod-ema-escalation-policy" {
  name = "${var.environment}-ema-escalation-policy"
  num_loops = 3
  teams = [var.pd_team]
  rule {
    escalation_delay_in_minutes = 15
    target {
      id   = data.pagerduty_user.ep-mgr.id
      type = "user_reference"
    }
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create EMA service
resource "pagerduty_service" "prod-ema-service" {
  name = "${var.environment}-ema-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-ema-escalation-policy.id
  alert_creation    = "create_alerts_and_incidents"
  incident_urgency_rule {
    type    = "constant"
    urgency = "high"
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create EMA service integration
resource "pagerduty_service_integration" "prod-ema-service-integration-datadog" {
  name    = pagerduty_service.prod-ema-service.name
  service = pagerduty_service.prod-ema-service.id
  vendor  = data.pagerduty_vendor.datadog.id
}

# PagerDuty config for SCR
# Create SCR escalation policy
resource "pagerduty_escalation_policy" "prod-scr-escalation-policy" {
  name = "${var.environment}-scr-escalation-policy"
  num_loops = 3
  teams = [var.pd_team]
  rule {
    escalation_delay_in_minutes = 15
    target {
      id   = data.pagerduty_user.ep-mgr.id
      type = "user_reference"
    }
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create SCR service
resource "pagerduty_service" "prod-scr-service" {
  name = "${var.environment}-scr-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-scr-escalation-policy.id
  alert_creation    = "create_alerts_and_incidents"
  incident_urgency_rule {
    type    = "constant"
    urgency = "high"
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create SCR service integration
resource "pagerduty_service_integration" "prod-scr-service-integration-datadog" {
  name    = pagerduty_service.prod-scr-service.name
  service = pagerduty_service.prod-scr-service.id
  vendor  = data.pagerduty_vendor.datadog.id
}

# PagerDuty config for SST
# Create SST escalation policy
resource "pagerduty_escalation_policy" "prod-sst-escalation-policy" {
  name = "${var.environment}-sst-escalation-policy"
  num_loops = 3
  teams = [var.pd_team]
  rule {
    escalation_delay_in_minutes = 15
    target {
      id   = data.pagerduty_user.ep-mgr.id
      type = "user_reference"
    }
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create SST service
resource "pagerduty_service" "prod-sst-service" {
  name = "${var.environment}-sst-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-sst-escalation-policy.id
  alert_creation    = "create_alerts_and_incidents"
  incident_urgency_rule {
    type    = "constant"
    urgency = "high"
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create SST service integration
resource "pagerduty_service_integration" "prod-sst-service-integration-datadog" {
  name    = pagerduty_service.prod-sst-service.name
  service = pagerduty_service.prod-sst-service.id
  vendor  = data.pagerduty_vendor.datadog.id
}

# PagerDuty config for STR
# Create STR escalation policy
resource "pagerduty_escalation_policy" "prod-str-escalation-policy" {
  name = "${var.environment}-str-escalation-policy"
  num_loops = 3
  teams = [var.pd_team]
  rule {
    escalation_delay_in_minutes = 15
    target {
      id   = data.pagerduty_user.ep-mgr.id
      type = "user_reference"
    }
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create STR service
resource "pagerduty_service" "prod-str-service" {
  name = "${var.environment}-str-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-str-escalation-policy.id
  alert_creation    = "create_alerts_and_incidents"
  incident_urgency_rule {
    type    = "constant"
    urgency = "high"
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create STR service integration
resource "pagerduty_service_integration" "prod-str-service-integration-datadog" {
  name    = pagerduty_service.prod-str-service.name
  service = pagerduty_service.prod-str-service.id
  vendor  = data.pagerduty_vendor.datadog.id
}

# PagerDuty config for APT
# Create APT escalation policy
resource "pagerduty_escalation_policy" "prod-apt-escalation-policy" {
  name = "${var.environment}-apt-escalation-policy"
  num_loops = 3
  teams = [var.pd_team]
  rule {
    escalation_delay_in_minutes = 15
    target {
      id   = data.pagerduty_user.ep-mgr.id
      type = "user_reference"
    }
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create APT service
resource "pagerduty_service" "prod-apt-service" {
  name = "${var.environment}-apt-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-apt-escalation-policy.id
  alert_creation    = "create_alerts_and_incidents"
  incident_urgency_rule {
    type    = "constant"
    urgency = "high"
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create APT service integration
resource "pagerduty_service_integration" "prod-apt-service-integration-datadog" {
  name    = pagerduty_service.prod-apt-service.name
  service = pagerduty_service.prod-apt-service.id
  vendor  = data.pagerduty_vendor.datadog.id
}