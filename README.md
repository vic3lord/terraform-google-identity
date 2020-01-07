# Workload-Identity Terraform module

The module helps managing GCP and Kubernetes service accounts using workload-identity

## Usage

```hcl
module "cool-service-name" {
  name         = "cool-service-name"
  namespace    = "k8s-namespace"
  project_id   = data.google_project.project.project_id

  gcp_roles = [
    "roles/pubsub.publisher"
  ]
}
```
