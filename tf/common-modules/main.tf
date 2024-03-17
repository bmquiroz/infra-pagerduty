# PagerDuty common config

terraform {
  required_providers {
    pagerduty = {
      source  = "pagerduty/pagerduty"
      version = "2.2.1"
    }
  }
}

# Create team
resource "pagerduty_team" "techdevsecops" {
  name = "Tech DevSecOps"
}

# Create schedule
resource "pagerduty_schedule" "techdevsecops-sev1-schedule" {
  name = "CORPTECH SEV1"
  time_zone = "America/New_York"
  teams = [pagerduty_team.example.id]
  layer {
    name = "Layer 1"
    rotation_turn_length_seconds = 604800
    start = var.rotation_start
    # end = var.rotation_end
    rotation_virtual_start = var.rotation_virtual_start
    users = [data.pagerduty_user.borisquiroz.id]
  }
}