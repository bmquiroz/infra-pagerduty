# Import user data
data "pagerduty_user" "app-support-mgr" {
  email = "bmquiroz@rc-its.com"
}

data "pagerduty_user" "devops-support-eng" {
  for_each = toset(var.oncall_users)
  email    = each.value
}

data "pagerduty_user" "database-support-eng" {
  for_each = toset(var.oncall_db_team)
  email    = each.value
}

data "pagerduty_user" "app-support-eng" {
  for_each = toset(var.oncall_app_team)
  email    = each.value
}