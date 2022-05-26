resource "google_folder" "foundation" {
  display_name = "Foundation"
  parent       = "organizations/${var.org_id}"

}

resource "google_folder" "services" {
  display_name = "Services"
  parent       = "organizations/${var.org_id}"

}

resource "google_folder" "environments" {
  display_name = "Environments"
  parent       = "organizations/${var.org_id}"

}

resource "google_folder" "ristkaridev" {
  display_name = "RistkariDev"
  parent       = google_folder.environments.name
}

resource "google_folder" "ristkaridevdev" {
  display_name = "RistkariDevDev"
  parent       = google_folder.environments.name
}
