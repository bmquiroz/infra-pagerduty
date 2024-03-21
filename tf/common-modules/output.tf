output "pd-team-id" {
  value = pagerduty_team.support-team.id
}

output "pd-schedule-id" {
  value = pagerduty_schedule.techdevsecops-sev1-schedule.id
}

output "pd-app-schedule-id" {
  value = pagerduty_schedule.app-sev1-schedule.id
}