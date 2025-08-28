resource "google_cloud_run_service" "simpleapp" {
  name     = "simpleapp"
  location = "asia-southeast2"

  template {
    spec {
      containers {
        image = "asia-southeast2-docker.pkg.dev/thinhs-project/my-registry/simpleapp:latest"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

