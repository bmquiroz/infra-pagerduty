variable "rotation_start" { type = string }

variable "rotation_end" { type = string }

variable "rotation_virtual_start" { type = string }

variable "pd_support_team" { type = string }

variable "pd_app_support_team" { type = string }

variable "pd_secret_value" {}

variable "oncall_gbst_devops" {
  description = "List of on-call user e-mails"
  type        = list(string)
}

variable "oncall_gbst_db" {
  description = "List of on-call user e-mails"
  type        = list(string)
}

variable "oncall_gbst_app" {
  description = "List of on-call user e-mails"
  type        = list(string)
}

variable "oncall_smrs_devops" {
  description = "List of on-call user e-mails"
  type        = list(string)
}

variable "oncall_smrs_db" {
  description = "List of on-call user e-mails"
  type        = list(string)
}

variable "oncall_smrs_app" {
  description = "List of on-call user e-mails"
  type        = list(string)
}

variable "oncall_dmg_devops" {
  description = "List of on-call user e-mails"
  type        = list(string)
}

variable "oncall_dmg_db" {
  description = "List of on-call user e-mails"
  type        = list(string)
}

variable "oncall_dmg_app" {
  description = "List of on-call user e-mails"
  type        = list(string)
}