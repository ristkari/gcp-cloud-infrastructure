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
