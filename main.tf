resource "google_service_account" "ci_role" {
  project = var.project_id
  account_id   = "ci-role"
  display_name = "Compute Instance user"
}

resource "google_project_iam_binding" "ci_role" {
  project = var.project_id
  role    = "roles/compute.instanceAdmin"
  members = [
    "serviceAccount:${google_service_account.ci_role.email}"
  ]
}

resource "google_project_service" "iam-api" {
  project = var.project_id
  service = "iam.googleapis.com"

  disable_dependent_services = true
}

resource "google_project_service" "cloudrm-api" {
  project = var.project_id
  service = ""cloudresourcemanager.googleapis.com""

  disable_dependent_services = true
}
