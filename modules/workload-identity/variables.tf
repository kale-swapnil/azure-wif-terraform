variable "identity_name" {
  type        = string
  description = "Prefix for SP and federation credential"
}

variable "application_id" {
  type        = string
  description = "Azure AD application (app registration) ID"
}

variable "federation_provider_id" {
  type        = string
  description = "ID of azuread_workload_identity_provider"
}

variable "audiences" {
  type        = list(string)
  description = "Allowed audiences for token exchange"
}

variable "subject" {
  type        = string
  description = "JWT subject claim (e.g. GitHub repo/ref pattern)"
}

variable "azure_role_definition" {
  type        = string
  description = "Role definition ID to assign (e.g. Contributor)"
}

variable "scope" {
  type        = string
  description = "Scope (subscription/resource group/etc.) for role assignment"
}

variable "key_vault_id" {
  type        = string
  description = "Optional: Key Vault ID for access policy injection"
  default     = ""
}
variable "client_id" {
  type        = string
  description = "Client ID of the Azure AD application"
}