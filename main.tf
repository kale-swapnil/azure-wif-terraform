provider "azurerm" {
  features {}   
}

provider "azuread" {
  
}

data "azurerm_subscription" "primary" {
  
}

data "azurerm_role_definition" "name" {
  name = "Contributor"
}

#Azure Entra App for Terraform CI

resource "azuread_application" "terraform_app" {
  display_name = "terraform-app"
}

#OIDC federation provider
resource "azuread_workload_identity_provider" "ci" {
    name = "github-actions-wif"
    issuer = "https://token.actions.githubusercontent.com"
    subject = "repo:${var.repo}:ref:refs/heads/${var.branch}"
    client_id_list = [azuread_application.terraform_app.application_id]
  
}

#Federated Identity + RBAC using module 

module "wif_identity" {
  source                   = "./modules/workload-identity"
  identity_name            = var.identity_name
  application_id           = azuread_application.terraform_app.application_id
  federation_provider_id   = azuread_workload_identity_provider.ci.id
  audiences                = ["api://AzureADTokenExchange"]
  subject                  = azuread_workload_identity_provider.ci.subject
  azure_role_definition    = data.azurerm_role_definition.contributor.id
  scope                    = data.azurerm_subscription.primary.id
  key_vault_id             = var.key_vault_id
  client_id = var.client_id
}

# Generate SP password and auto-rotate via Key Vault
resource "random_password" "sp_password" {
  length  = 32
  special = true
}

resource "azuread_service_principal_password" "sp_password" {
  service_principal_id = module.wif_identity.sp_id
  value                = random_password.sp_password.result
}

resource "azurerm_key_vault_secret" "sp_credential" {
  name  = "${var.identity_name}-secret"
  value = random_password.sp_password.result
  key_vault_id = var.key_vault_id 
  

  depends_on = [
    azuread_service_principal_password.sp_password
  ]
}