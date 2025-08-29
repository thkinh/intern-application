resource "google_monitoring_uptime_check_config" "simpleapp_https" {
  display_name = "simpleapp-https-uptime"
  period       = "60s"
  timeout      = "10s"

  http_check {
    path         = "/"
    port         = 443
    use_ssl      = true
    validate_ssl = true
  }

  monitored_resource {
    type = "uptime_url"
    labels = {
      project_id = "thinhs-project"
      host       = var.simpleapp_host
    }
  }
}
