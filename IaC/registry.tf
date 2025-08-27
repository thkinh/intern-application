resource "google_artifact_registry_repository" "my_registry" {
  location      = "asia-southeast2"
  repository_id = "my-registry"
  description   = "Docker registry for Node.js app"
  format        = "DOCKER"
}


