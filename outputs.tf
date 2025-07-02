output "service_principal_id" {
  value = module.wif_identity.sp_id
}

output "federated_credential_id" {
  value = module.wif_identity.federated_credential_id
}
