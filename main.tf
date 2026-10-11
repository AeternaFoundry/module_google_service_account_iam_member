resource "google_service_account_iam_member" "service_account_iam_members" {
  for_each = var.service_account_iam_members

  member             = each.value.member
  role               = each.value.role
  service_account_id = each.value.service_account_id

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

