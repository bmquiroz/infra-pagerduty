provider "pagerduty" {
  token = var.pd_secret_value
}

# Create team
resource "pagerduty_team" "support-team" {
  name = var.pd_support_team
}

# Create team
resource "pagerduty_team" "app-support-team" {
  name = var.pd_app_support_team
}

# Create schedule
resource "pagerduty_schedule" "techdevsecops-sev1-schedule" {
  name = "CORPTECH SEV1"
  time_zone = "America/New_York"
  teams = [pagerduty_team.support-team.id]
  layer {
    name = "DevSecOps"
    rotation_turn_length_seconds = 604800
    start = var.rotation_start
    # end = var.rotation_end
    rotation_virtual_start = var.rotation_virtual_start
    # users = [data.pagerduty_user.app-support-mgr.id]
    users = [for user in data.pagerduty_user.devops-support-eng : user.id]
  }
  layer {
    name = "Database"
    rotation_turn_length_seconds = 604800
    start = var.rotation_start
    # end = var.rotation_end
    rotation_virtual_start = var.rotation_virtual_start
    # users = [data.pagerduty_user.app-support-mgr.id]
    users = [for user in data.pagerduty_user.database-support-eng : user.id]
  }
}

resource "pagerduty_schedule" "app-sev1-schedule" {
  name = "APPTEAM SEV1"
  time_zone = "America/New_York"
  teams = [pagerduty_team.support-team.id]
  layer {
    name = "Layer 1"
    rotation_turn_length_seconds = 604800
    start = var.rotation_start
    # end = var.rotation_end
    rotation_virtual_start = var.rotation_virtual_start
    # users = [data.pagerduty_user.app-support-mgr.id]
    users = [for user in data.pagerduty_user.app-support-eng : user.id]
  }
}