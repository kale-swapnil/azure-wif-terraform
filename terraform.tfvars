identity_name = "terraform-ci-identity"

# GitHub repo where federation will originate
repo = "kale-swapnil/azure-wif-terraform"

# Branch or ref to bind the federated identity to
branch = "main"

# Resource ID of your existing Azure Key Vault
key_vault_id = "/subscriptions/366d84a8-7475-45d4-97d3-f44d0f00d92a/resourceGroups/terraform-oidc/providers/Microsoft.KeyVault/vaults/terraform-oidc"
