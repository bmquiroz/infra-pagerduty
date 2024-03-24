# Import user data
data "pagerduty_user" "app-support-mgr" {
  email = "bmquiroz@rc-its.com"
}

data "pagerduty_user" "gbst-devops-support-eng" {
  for_each = toset(var.oncall_gbst_devops)
  email    = each.value
}

data "pagerduty_user" "gbst-database-support-eng" {
  for_each = toset(var.oncall_gbst_db)
  email    = each.value
}

data "pagerduty_user" "gbst-app-support-eng" {
  for_each = toset(var.oncall_gbst_app)
  email    = each.value
}

data "pagerduty_user" "smrs-devops-support-eng" {
  for_each = toset(var.oncall_smrs_devops)
  email    = each.value
}

data "pagerduty_user" "smrs-database-support-eng" {
  for_each = toset(var.oncall_smrs_db)
  email    = each.value
}

data "pagerduty_user" "smrs-app-support-eng" {
  for_each = toset(var.oncall_smrs_app)
  email    = each.value
}

data "pagerduty_user" "dmg-devops-support-eng" {
  for_each = toset(var.oncall_dmg_devops)
  email    = each.value
}

data "pagerduty_user" "dmg-database-support-eng" {
  for_each = toset(var.oncall_dmg_db)
  email    = each.value
}

data "pagerduty_user" "dmg-app-support-eng" {
  for_each = toset(var.oncall_dmg_app)
  email    = each.value
}