resource "google_service_account" "ci_role" {
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
