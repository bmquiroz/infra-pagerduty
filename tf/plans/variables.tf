variable "backend_bucket" {
  type        = string
  default     = "pagerduty-config-bucket"
}
 
variable "backend_key" {
  type        = string
  default     = "pagerduty-tf-state/"
}
 
variable "backend_region" {
  type = string
  default = "us-east-1"
}

variable "pd-secret-value" {
}

variable "pd_gbst_ep_user_email " {
  type = string
}