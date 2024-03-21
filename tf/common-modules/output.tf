output "pd-team-id" {
  value = pagerduty_team.support-team.id
}

output "pd-gbst-schedule-id" {
  value = pagerduty_schedule.techdevsecops-sev1-gbst-schedule.id
}

output "pd-db-gbst-schedule-id" {
  value = pagerduty_schedule.techdb-sev1-gbst-schedule.id
}

output "pd-app-gbst-schedule-id" {
  value = pagerduty_schedule.app-sev1-gbst-schedule.id
}