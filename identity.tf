data "google_iam_policy" "id" {
  binding {
    role = "roles/iam.workloadIdentityUser"

    members = [
      format("serviceAccount:%s.svc.id.goog[%s/%s]", var.project_id, var.namespace, var.name)
    ]
  }
}

resource "google_service_account" "id" {
  account_id   = local.account_id
  display_name = var.name
}

resource "google_service_account_iam_policy" "id" {
  service_account_id = google_service_account.id.name
  policy_data        = data.google_iam_policy.id.policy_data
}

resource "google_project_iam_member" "access" {
  for_each = var.gcp_roles
  project  = var.project_id
  role     = each.value
  member   = format("serviceAccount:%s", google_service_account.id.email)
}
