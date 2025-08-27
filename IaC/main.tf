terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.8.0"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = "asia-southeast2"
  credentials = "key.json"
}

#Xoa cai first time with project
resource "google_project_service" "project" {
  project = "thinhs-project"
  service = "iam.googleapis.com"

  disable_dependent_services = true
}



