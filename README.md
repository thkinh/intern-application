# Objective
- Build and test a simple web API
- Package it in a secure Docker image
- Publish the image to Google Artifact Registry
- Deploy to Google Cloud Run (fully managed)
- Automate with GitHub Actions (preferred) or Cloud Build, triggered on main branch push.


## 1. What to Build
- [X] Create a small "Hello World" JSON API using either:
      Node.js with Express OR Python with FastAPI
      Output: { "status": "ok" }
- [X] Keep the code under 50 lines

## 2. Pipeline Tasks
- [O] CI:
    - [X] Lint & unit tests
    - [X] Multi-stage Docker build
    - [X] Vulnerability scan (e.g. Trivy)
    - [X] Push to Artifact Registry with vX.Y.Z and latest tags
- [.] CD:
    - [X] Deploy/update to Cloud Run
    - [ ] Full traffic to latest revision
    - [ ] Manual rollback instructions

## 3. After Deploy:
- [X] Security:
    - [X] Use non-root image
    - [X] Use GCP Secret Manager or GitHub Secrets (no plain-text keys)
- [ ] Observability:
    - [X] Enable Cloud Logging
    - [ ] Add health check or uptime probe
     
## 4. Constraints
- [X] Use personal GCP free-tier project
- [X] Stay within free-tier usage
- [X] Use least-privilege IAM roles (e.g., run.admin, artifactregistry.writer) - Use gcloud CLI or Terraform and explain choice )
 
## 5. What to Submit
- [X] Public GitHub repo with commit history
- [ ] README (<= 2 pages): setup, IAM roles, cost estimate, decisions
- [ ] Demo video (<= 3 mins): push to deploy, app running, logs/scans
- [X] Live Cloud Run URL
- [ ] Optional: architecture.png or mermaid.md

