provider "pagerduty" {
  token = var.pd_secret_value
}

# Create LoB escalation policy
resource "pagerduty_escalation_policy" "prod-gbst-escalation-policy" {
  name = "${var.environment}-gbst-escalation-policy"
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

# PagerDuty config for GPS
# Create GPS escalation policy
# resource "pagerduty_escalation_policy" "prod-gps-escalation-policy" {
#   name = "${var.environment}-gps-escalation-policy"
#   num_loops = 3
#   teams = [var.pd_team]
#   rule {
#     escalation_delay_in_minutes = 15
#     target {
#       id   = data.pagerduty_user.ep-mgr.id
#       type = "user_reference"
#     }
#     target {
#       id   = var.pd_schedule
#       type = "schedule_reference"
#     }
#   }
#   lifecycle {
#     ignore_changes = all
#   }
# }

# Create GPS service
resource "pagerduty_service" "prod-gps-service" {
  name = "${var.environment}-gps-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-gbst-escalation-policy.id
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
# resource "pagerduty_escalation_policy" "prod-brd-escalation-policy" {
#   name = "${var.environment}-brd-escalation-policy"
#   num_loops = 3
#   teams = [var.pd_team]
#   rule {
#     escalation_delay_in_minutes = 15
#     target {
#       id   = data.pagerduty_user.ep-mgr.id
#       type = "user_reference"
#     }
#     target {
#       id   = var.pd_schedule
#       type = "schedule_reference"
#     }
#   }
#   lifecycle {
#     ignore_changes = all
#   }
# }

# Create BRD service
resource "pagerduty_service" "prod-brd-service" {
  name = "${var.environment}-brd-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-gbst-escalation-policy.id
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
# resource "pagerduty_escalation_policy" "prod-deb-escalation-policy" {
#   name = "${var.environment}-deb-escalation-policy"
#   num_loops = 3
#   teams = [var.pd_team]
#   rule {
#     escalation_delay_in_minutes = 15
#     target {
#       id   = data.pagerduty_user.ep-mgr.id
#       type = "user_reference"
#     }
#     target {
#       id   = var.pd_schedule
#       type = "schedule_reference"
#     }
#   }
#   lifecycle {
#     ignore_changes = all
#   }
# }

# Create DEB service
resource "pagerduty_service" "prod-deb-service" {
  name = "${var.environment}-deb-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-gbst-escalation-policy.id
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
# resource "pagerduty_escalation_policy" "prod-jag-escalation-policy" {
#   name = "${var.environment}-jag-escalation-policy"
#   num_loops = 3
#   teams = [var.pd_team]
#   rule {
#     escalation_delay_in_minutes = 15
#     target {
#       id   = data.pagerduty_user.ep-mgr.id
#       type = "user_reference"
#     }
#     target {
#       id   = var.pd_schedule
#       type = "schedule_reference"
#     }
#   }
#   lifecycle {
#     ignore_changes = all
#   }
# }

# Create JAG service
resource "pagerduty_service" "prod-jag-service" {
  name = "${var.environment}-jag-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-gbst-escalation-policy.id
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
# resource "pagerduty_escalation_policy" "prod-ppl-escalation-policy" {
#   name = "${var.environment}-ppl-escalation-policy"
#   num_loops = 3
#   teams = [var.pd_team]
#   rule {
#     escalation_delay_in_minutes = 15
#     target {
#       id   = data.pagerduty_user.ep-mgr.id
#       type = "user_reference"
#     }
#     target {
#       id   = var.pd_schedule
#       type = "schedule_reference"
#     }
#   }
#   lifecycle {
#     ignore_changes = all
#   }
# }

# Create PPL service
resource "pagerduty_service" "prod-ppl-service" {
  name = "${var.environment}-ppl-service"
  # auto_resolve_timeout = 14400
  # acknowledgement_timeout = 1800
  escalation_policy = pagerduty_escalation_policy.prod-gbst-escalation-policy.id
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