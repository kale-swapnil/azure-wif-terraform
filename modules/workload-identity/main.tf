resource "azuread_service_principal" "this" {
  #application_id = var.application_id
  #display_name   = var.identity_name
  client_id = var.client_id
}


resource "azuread_federated_identity_credential" "this" {
  name                          = "${var.identity_name}-federation"
  service_principal_id          = azuread_service_principal.this.id
  workload_identity_provider_id = var.federation_provider_id
  audiences                     = var.audiences
  subject                       = var.subject
}

resource "azurerm_role_assignment" "this" {
  scope              = var.scope
  role_definition_id = var.azure_role_definition
  principal_id       = azuread_service_principal.this.id
}

resource "azurerm_key_vault_access_policy" "kv_policy" {
  count         = var.key_vault_id != "" ? 1 : 0
  key_vault_id  = var.key_vault_id
  tenant_id     = data.azurerm_client_config.current.tenant_id
  object_id     = azuread_service_principal.this.object_id
  secret_permissions = [
    "Get",
    "List"
  ]
}
