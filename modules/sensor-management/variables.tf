variable "external_id" {
  type        = string
  description = "Unique identifier provided by CrowdStrike for secure cross-account access"
}

variable "intermediate_role_arn" {
  type        = string
  description = "ARN of CrowdStrike's intermediate role"
}

variable "falcon_client_id" {
  type        = string
  sensitive   = true
  description = "Falcon API Client ID"
}

variable "falcon_client_secret" {
  type        = string
  sensitive   = true
  description = "Falcon API Client Secret"
}

variable "permissions_boundary" {
  type        = string
  default     = ""
  description = "The name of the policy used to set the permissions boundary for IAM roles"
}

variable "resource_prefix" {
  description = "The prefix to be added to all resource names"
  default     = ""
  type        = string
}

variable "resource_suffix" {
  description = "The suffix to be added to all resource names"
  default     = ""
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources that support tagging"
  type        = map(string)
  default     = {}
}

variable "account_type" {
  type        = string
  default     = "commercial"
  description = "Account type can be either 'commercial' or 'gov'"
  validation {
    condition     = var.account_type == "commercial" || var.account_type == "gov"
    error_message = "must be either 'commercial' or 'gov'"
  }
}

variable "is_gov" {
  type        = bool
  default     = false
  description = "Set to true if deploying in a gov Falcon environment (eagle, merlin)"
}

variable "cs_address" {
  type        = string
  default     = ""
  description = "CrowdStrike Falcon address for the Lambda to authenticate against (e.g. az.laggar.gcw.crowdstrike.com:443)"
}

# EARNIN FORK
variable "manage_secret_value" {
  type        = bool
  default     = true
  description = "EARNIN FORK: when true (upstream default) Terraform writes the Falcon client secret into the FalconAPICredentials secret version. Set false to create only the empty secret container and populate the value manually, keeping the secret out of Terraform state (required by EarnIn's hard-mandatory Sentinel policy)."
}

# EARNIN FORK
variable "secret_replica_regions" {
  type        = list(string)
  default     = []
  description = "EARNIN FORK: regions to replicate the FalconAPICredentials secret to. The secret still lives in the primary region; replicas are read-only copies that satisfy DR/multi-region guardrails (e.g. an SCP requiring secret replication). Empty = no replicas (upstream behavior)."
}
