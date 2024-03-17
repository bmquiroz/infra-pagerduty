# Core Deployment Information
variable "rotation_start" { type = string }

variable "rotation_virtual_start" { type = string }

variable "pd_support_team" { type = string }

variable "pd_secret_value" {}

variable "oncall_users" {
  description = "List of on-call user e-mails"
  type        = list(string)
}