resource "google_service_account" "dev1" {
  account_id   = "dev1-sa"
  display_name = "DevOps Intern Account"
}

# Allow pushing Docker images
resource "google_project_iam_member" "artifact_registry_writer" {
  project = var.project_id
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:${google_service_account.dev1.email}"
}

# Allow deploying/updating Cloud Run services
resource "google_project_iam_member" "cloud_run_admin" {
  project = var.project_id
  role    = "roles/run.admin"
  member  = "serviceAccount:${google_service_account.dev1.email}"
}

# Allow using other service accounts (needed by Cloud Run)
resource "google_project_iam_member" "service_account_user" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.dev1.email}"
}

