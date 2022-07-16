resource "google_folder" "services" {
  display_name = "CommonServices"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "environments" {
  display_name = "Environments"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "ristkaridev" {
  display_name = "ristkari_dev"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "dev" {
  display_name = "dev"
  parent       = google_folder.environments.id
}

resource "google_folder" "stg" {
  display_name = "stg"
  parent       = google_folder.environments.id
}

resource "google_folder" "prd" {
  display_name = "prd"
  parent       = google_folder.environments.id
}

resource "google_project" "dev_shared_vpc" {
  name            = "vpc-dev-00001"
  project_id      = "vpc-dev-00001"
  folder_id       = google_folder.services.name
  billing_account = var.common_service_billing_account
}

resource "google_project" "stg_shared_vpc" {
  name            = "vpc-stg-00001"
  project_id      = "vpc-stg-00001"
  folder_id       = google_folder.services.name
  billing_account = var.common_service_billing_account
}

resource "google_project" "prd_shared_vpc" {
  name            = "vpc-prd-00001"
  project_id      = "vpc-prd-00001"
  folder_id       = google_folder.services.name
  billing_account = var.common_service_billing_account
}
