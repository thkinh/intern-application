# Cloud Run Hello World API

## Overview
This project demonstrates a complete CI/CD pipeline for deploying a minimal web API to **Google Cloud Run**.
It covers secure containerization, vulnerability scanning, artifact publishing, and automated deployment with GitHub Actions.

**Live URL**: https://simpleapp-1032571919249.asia-southeast2.run.app

## Objective
* Build and test a simple API
* Package in a secure Docker image
* Publish to Google Artifact Registry
* Deploy to Cloud Run (fully managed)
* Automate with GitHub Actions

## Feature
* Hello World API – returns { "status": "ok" } in under 50 lines
* CI Pipeline – linting, unit tests, multi-stage Docker build, Trivy vulnerability scan
* CD Pipeline – deploys to Cloud Run with 100% traffic on latest revision, rollback supported
* Security – non-root image, secrets managed via GitHub/GCP Secret Manager
* Observability – Cloud Logging enabled, health check/uptime probe added

## Setup
* Google Cloud Project (free tier)
* gcloud CLI installed and authenticated
* Docker installed locally
* Terraform installed and setup locally

### Steps
1. Clone the repo
2. Authenticate gcloud CLI using `gcloud auth login` and `gcloud auth configure-docker`
3. Put the GCP Service Account key inside the **IAC/** directory as *key.json* (for running terraform)
4. Configure the environment variables (.envrc)
5. If you want to apply the infras, run `terraform apply` in the **IaC/** directory. However, it won't be succeed if you don't build and have the image in the registry first. Instead, code your app with an entry point is server.js, and push the code to the repo, the workflow will be triggered for you.

## IAM ROLEs
Follow least-privilege principle:
* `roles/run.admin` → Deploy to Cloud Run
* `roles/artifactregistry.writer` → Push images
* `roles/iam.serviceAccountUser` → GitHub Actions SA impersonation
<img width="1063" height="876" alt="2025-08-29-121951_hyprshot" src="https://github.com/user-attachments/assets/c8996009-b112-483e-bebb-3cd815b97d6d" />


These are all defined in IaC/service_account.tf

## Cost Estimate
* Artifact Registry: Free up to 0.5 GB stored & 0.5 GB egress/month
* Cloud Run: 2 million requests/month, 360,000 GB-s compute free
* Logging/Monitoring: Free basic tier
 
--> Entire project fits within GCP free tier (if usage is low)

## Decisions
- I choose **Nodejs** with **express** because it's more familiar
- I choose **Terraform** over **gcloud CLI** because its declarative and easy to apply/destroy
- All the service account, health check, Cloudrun container,.. are declared in **IAC/** dir
- The rollback instructions and check list is in the **docs/** directory
