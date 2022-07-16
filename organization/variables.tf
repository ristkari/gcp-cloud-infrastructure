variable "org_id" {
  description = "Organizations domain"
  type        = string
}

variable "terraform_service_account" {
  description = "Terraform Service Account"
  type        = string
}

variable "common_service_billing_account" {
  description = "Billing account for common services"
  type        = string
}

variable "resource_project_billing_account" {
  description = "Billing account for resource projects"
  type        = string
}
