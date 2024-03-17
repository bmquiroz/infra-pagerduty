variable "backend-bucket" {
  type        = string
  default     = "pagerduty-config-bucket"
}
 
variable "backend-key" {
  type        = string
  default     = "pagerduty-tf-state/"
}
 
variable "backend-region" {
  type = string
  default = "us-east-1"
}