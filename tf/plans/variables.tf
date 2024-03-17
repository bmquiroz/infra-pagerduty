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