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

output "pd-smrs-schedule-id" {
  value = pagerduty_schedule.techdevsecops-sev1-smrs-schedule.id
}

output "pd-db-smrs-schedule-id" {
  value = pagerduty_schedule.techdb-sev1-smrs-schedule.id
}

output "pd-app-smrs-schedule-id" {
  value = pagerduty_schedule.app-sev1-smrs-schedule.id
}

output "pd-dmg-schedule-id" {
  value = pagerduty_schedule.techdevsecops-sev1-dmg-schedule.id
}

output "pd-db-dmg-schedule-id" {
  value = pagerduty_schedule.techdb-sev1-dmg-schedule.id
}

output "pd-app-dmg-schedule-id" {
  value = pagerduty_schedule.app-sev1-dmg-schedule.id
}