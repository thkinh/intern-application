resource "google_artifact_registry_repository" "my_registry" {
  location      = "asia-southeast2"
  repository_id = "my-registry"
  description   = "Docker registry for Node.js app"
  format        = "DOCKER"
}

resource "google_project_iam_binding" "artifact_registry_writer" {
  project = "thinhs-project"
  role    = "roles/artifactregistry.writer"

  members = [
    "serviceAccount:thkinh@thinhs-project.iam.gserviceaccount.com",
  ]
}


