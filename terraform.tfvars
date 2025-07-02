identity_name = "terraform-ci-identity"

# GitHub repo where federation will originate
repo = "your-org/your-repo"

# Branch or ref to bind the federated identity to
branch = "main"

# Resource ID of your existing Azure Key Vault
key_vault_id = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/rg-security/providers/Microsoft.KeyVault/vaults/kv-infra-secrets"
