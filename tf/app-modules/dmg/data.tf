data "pagerduty_vendor" "datadog" {
  name = "Datadog"
}

data "pagerduty_user" "ep-mgr" {
  email = var.pd_dmg_ep_app_mgr_email
}