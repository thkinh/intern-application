variable "project_id" {
  type        = string
  description = "GCP project ID"
  sensitive   = true
}

variable "google_credentials" {
  type        = string
  description = "Service account credentials JSON"
  sensitive   = true
}

