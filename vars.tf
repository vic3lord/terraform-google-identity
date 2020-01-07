variable "name" {
  description = "Name of the service account in Kubernetes and GCP"
}

variable "namespace" {
  description = "Kubernetes namespace for this service account"
}

variable "project_id" {
  description = "Google Cloud Project ID"
}

variable "account_name" {
  description = "Set the GCP service account name"
  default     = null
}

variable "gcp_roles" {
  description = "List of GCP roles to assign to a service account"
  type        = set(string)
  default     = []
}

locals {
  account_id = var.account_name != null ? var.account_name : var.name
}

