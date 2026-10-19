variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket to create"
}

variable "versioning_enabled" {
  type        = bool
  description = "When true the s3 bucket contents will be versioned"
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "Additional tags to apply to the bucket"
  default     = {}
}

variable "force_destroy" {
  type        = bool
  description = "Allow a bucket to be destroyed when it is not empty"
  default     = false
}

variable "read_roles" {
  type        = list(string)
  description = "A list of ARNs to allow actions for reading files"
  default     = []
}

variable "write_roles" {
  type        = list(string)
  description = "A list of ARNs to allow actions for writing files"
  default     = []
}

variable "list_roles" {
  type        = list(string)
  description = "A list of ARNs to allow actions for listing file names"
  default     = []
}

variable "admin_roles" {
  type        = list(string)
  description = "A list of ARNs to allow roles for admin access. Roles in this list can can make admin api calls as well as list objects in bucket"
  default     = []
}

variable "grant_current_provisioner_admin_access" {
  type        = bool
  description = "Whether to automatically grant the IAM role currently running Terraform admin access to the bucket, to avoid accidental self-lockout. Set to false if the role running plan (e.g. a read-only planner role) should never gain admin access."
  default     = true
}

variable "metadata_read_roles" {
  type        = list(string)
  description = "A list of ARNs to allow to access metadata to enable bucket audit"
  default     = []
}

variable "data_sensitivity" {
  type        = string
  description = "For buckets with PII or other sensitive data, the tag data_sensitivity: high must be applied."

  validation {
    condition     = var.data_sensitivity == "high" || var.data_sensitivity == "low"
    error_message = "The data_sensitivity value must be \"high\" or \"low\"."
  }
}

variable "log_bucket_id" {
  type        = string
  description = "The name of the access logs bucket"
}

variable "restricted_ip_access" {
  type        = list(string)
  description = "A list of IPs to restrict all s3 access to"
  default     = []
}

variable "restricted_vpce_access" {
  type        = list(string)
  description = "A list of VPCe(s) to restrict all s3 access to"
  default     = []
}

variable "data_expiry" {
  type        = string
  description = "1-day, 1-week, 1-month, 90-days, 6-months, 1-year, 18-months, 7-years, 10-years or forever-config-only"

  validation {
    condition     = var.data_expiry == "1-day" || var.data_expiry == "1-week" || var.data_expiry == "1-month" || var.data_expiry == "90-days" || var.data_expiry == "6-months" || var.data_expiry == "1-year" || var.data_expiry == "18-months" || var.data_expiry == "7-years" || var.data_expiry == "10-years" || var.data_expiry == "forever-config-only"
    error_message = "The data_expiry value must be \"1-day\", \"1-week\", \"1-month\", \"90-days\", \"6-months\", \"1-year\", \"18  -months\", \"7-years\", \"10-years\" or \"forever-config-only\"."
  }
}

variable "required_tags_with_restricted_values" {
  type        = map(list(string))
  description = "A map of required tags and their values"
  default     = {}
}

variable "transition_to_glacier_days" {
  description = "The number of days after object creation when the object will transition to Glacier storage; if 0, Glacier transition is disabled"
  type        = number
  default     = 0
}

variable "transition_to_standard_ia_days" {
  description = "Days after object creation to transition to STANDARD_IA; 0 disables the transition"
  type        = number
  default     = 0

  validation {
    condition = var.transition_to_standard_ia_days == null ? false : (
      floor(var.transition_to_standard_ia_days) == var.transition_to_standard_ia_days &&
      (var.transition_to_standard_ia_days == 0 || var.transition_to_standard_ia_days >= 30)
    )
    error_message = "The transition_to_standard_ia_days value must be 0 (disabled) or a whole number of at least 30 days."
  }
}

variable "transition_to_onezone_ia_days" {
  description = "Days after object creation to transition to ONEZONE_IA; 0 disables the transition"
  type        = number
  default     = 0

  validation {
    condition = var.transition_to_onezone_ia_days == null ? false : (
      floor(var.transition_to_onezone_ia_days) == var.transition_to_onezone_ia_days &&
      (var.transition_to_onezone_ia_days == 0 || var.transition_to_onezone_ia_days >= 30)
    )
    error_message = "The transition_to_onezone_ia_days value must be 0 (disabled) or a whole number of at least 30 days."
  }
}

variable "transition_to_intelligent_tiering_days" {
  description = "Days after object creation to transition to INTELLIGENT_TIERING; 0 disables the transition"
  type        = number
  default     = 0

  validation {
    condition = var.transition_to_intelligent_tiering_days == null ? false : (
      var.transition_to_intelligent_tiering_days >= 0 &&
      floor(var.transition_to_intelligent_tiering_days) == var.transition_to_intelligent_tiering_days
    )
    error_message = "The transition_to_intelligent_tiering_days value must be a non-negative whole number; 0 disables the transition."
  }
}

variable "transition_to_glacier_ir_days" {
  description = "Days after object creation to transition to GLACIER_IR; 0 disables the transition"
  type        = number
  default     = 0

  validation {
    condition = var.transition_to_glacier_ir_days == null ? false : (
      var.transition_to_glacier_ir_days >= 0 &&
      floor(var.transition_to_glacier_ir_days) == var.transition_to_glacier_ir_days
    )
    error_message = "The transition_to_glacier_ir_days value must be a non-negative whole number; 0 disables the transition."
  }
}

variable "transition_to_deep_archive_days" {
  description = "Days after object creation to transition to DEEP_ARCHIVE; 0 disables the transition"
  type        = number
  default     = 0

  validation {
    condition = var.transition_to_deep_archive_days == null ? false : (
      var.transition_to_deep_archive_days >= 0 &&
      floor(var.transition_to_deep_archive_days) == var.transition_to_deep_archive_days
    )
    error_message = "The transition_to_deep_archive_days value must be a non-negative whole number; 0 disables the transition."
  }
}

variable "read_services" {
  type        = list(string)
  description = "A list of AWS Service Principles to allow actions for reading files"
  default     = []
}

variable "list_services" {
  type        = list(string)
  description = "A list of AWS Service Principles to allow actions for listing file names"
  default     = []
}

variable "metadata_read_services" {
  type        = list(string)
  description = "A list of AWS Service Principles to allow to access metadata to enable bucket audit"
  default     = []
}

variable "write_services" {
  type        = list(string)
  description = "A list of AWS Service Principles to allow actions for writing files"
  default     = []
}

variable "allow_guardduty_metadata_audit" {
  type        = bool
  description = "Adds the AWS GuradDuty service linked role to check metadata of the bucket. This allows it to alert on buckets made public"
  default     = true
}

variable "allow_security_team_metadata_audit" {
  type        = bool
  description = "Adds the role RoleSecurityReadOnly to check metadata of the bucket. This role is used for manual and automated checks"
  default     = true
}

variable "object_lock" {
  description = "Specify whether to lock objects on the bucket to prevent modification"
  type        = bool
  default     = false
}

variable "object_lock_mode" {
  type        = string
  description = "COMPLIANCE or GOVERNANCE"
  default     = "COMPLIANCE"

  validation {
    condition     = var.object_lock_mode == "COMPLIANCE" || var.object_lock_mode == "GOVERNANCE"
    error_message = "The object_lock_mode must be \"COMPLIANCE\" or \"GOVERNANCE\"."
  }
}

variable "kms_rotation_period_in_days" {
  type        = number
  description = "Custom KMS rotation interval; must be between 90 and 2560 days"
  default     = 90
  validation {
    condition     = var.kms_rotation_period_in_days >= 90 && var.kms_rotation_period_in_days <= 2560
    error_message = "KMS rotation period in days must be between 90 and 2560 (inclusive)."
  }
}
