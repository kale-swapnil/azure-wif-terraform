output "sp_id" {
  value = azuread_service_principal.this.id
}

output "sp_object_id" {
  value = azuread_service_principal.this.object_id
}

output "federated_credential_id" {
  value = azuread_application_federated_identity_credential.this.id
}
