variable "identity_name" {
  type        = string
  description = "Prefix for SP, federation credential, and Key Vault secret"
  default     = "ci-identity"
}

variable "repo" {
  type        = string
  description = "GitHub repo in the form owner/name"
}

variable "branch" {
  type        = string
  description = "Branch or ref for the federation subject"
}

variable "key_vault_id" {
  type        = string
  description = "Resource ID of an existing Key Vault for storing SP secrets"
}

variable "client_id" {
  type        = string
  description = "Client ID of the Azure AD application"
  default     = ""
  
}
