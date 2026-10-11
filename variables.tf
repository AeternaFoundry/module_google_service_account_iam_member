variable "service_account_iam_members" {
  description = <<EOT
Map of service_account_iam_members, attributes below
Required:
    - member
    - role
    - service_account_id
Optional:
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    member             = string
    role               = string
    service_account_id = string
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

