variable "folder" {
  description = "Services folder"
  type        = string
}

variable "org_id" {
  description = "Organizations domain"
  type        = string
}

variable "terraform_service_account" {
  description = "Terraform Service Account"
  type        = string
}

variable "excluded_folders" {
  description = "Folders excluded from policies"
  type        = list(string)
}
