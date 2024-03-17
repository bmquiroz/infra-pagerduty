# Import user data
data "pagerduty_user" "app-support-mgr" {
  email = "bmquiroz@rc-its.com"
}

data "pagerduty_user" "devops-support-eng" {
  for_each = toset(var.oncall_users)
  email    = each.value
}