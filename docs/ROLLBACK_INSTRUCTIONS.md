# How To Rollback When a Bug Is Encountered
## With Terraform
- In the current deployment (**cloud_run.tf**), the service traffic is set to always use the latest revision:

```
traffic {
  percent         = 100
  latest_revision = true
}
```
- When things happen, you can modify this traffic block to pin to a specific revision that was more stable and bug-free.

_Ex:_
```
traffic {
  percent         = 100
  revision_name   = "simpleapp-00002-abc" # name of the stable revision
}
```
- Then apply the change:

`terraform apply`

## With Google Cloud Run YAML
1. Retrieve the yaml file for our running service:
```
gcloud run services describe simpleapp \
    --format export \
    --region asia-southeast2 \
    --project thinhs-project \
    > service.yaml
```

2. Edit the traffic part in the yaml file:
``` 
traffic:
  - latestRevision: true
    percent: 100
```
Change it to the revision we want:

_Ex:_
```
traffic:
  - latestRevision: true
    percent: 0 
  - percent: 100
    revisionName: simpleapp-0001-xyz # name of the stable version
```

3. Run to apply the config:

`gcloud run services replace service.yaml --project thinhs-project`    

4. You can verify available revisions before rollback:

`glcoud run revisions list --region asia-southeast2 --projects thinhs-project`


