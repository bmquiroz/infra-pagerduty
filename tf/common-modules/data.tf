# Import user data
data "pagerduty_user" "app-support-mgr" {
  email = "bmquiroz@rc-its.com"
}

data "pagerduty_user" "devops-support-eng" {
  for_each = toset(var.oncall_gbst_devops)
  email    = each.value
}

data "pagerduty_user" "database-support-eng" {
  for_each = toset(var.oncall_gbst_db)
  email    = each.value
}

data "pagerduty_user" "app-support-eng" {
  for_each = toset(var.oncall_gbst_app)
  email    = each.value
}