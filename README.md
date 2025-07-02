## 📘 README.md

```markdown
# 🔐 Secrets as Code with Azure AD Workload Identity Federation

This repository demonstrates how to implement secure, credential-less access to Azure resources using Workload Identity Federation (WIF) and Terraform. It enables GitHub Actions to deploy infrastructure without long-lived service principal secrets—treating secrets as code, at scale.

## 🚀 What This Repository Does

- Sets up an Azure AD application + service principal
- Configures Workload Identity Federation for GitHub OIDC tokens
- Assigns scoped RBAC permissions (e.g., Contributor role)
- Optionally injects access to Azure Key Vault
- Demonstrates secret auto-rotation using `azurerm_key_vault_secret`
- Fully orchestrated using parameterized Terraform modules

## 🧰 Technologies Used

- **Terraform** ≥ 1.3
- **AzureAD provider** for identity + federation setup
- **AzureRM provider** for resource permissions and Key Vault
- **GitHub Actions** using OIDC tokens (no client secrets!)


## 🔧 Getting Started

1. **Clone this repo** and configure `terraform.tfvars`:
   ```hcl
   identity_name  = "terraform-ci"
   repo           = "your-org/your-repo"
   branch         = "main"
   key_vault_id   = "<resource ID of your Key Vault>"
   ```

2. **Create GitHub Secrets** under your repo settings:
   - `AZURE_CLIENT_ID`
   - `AZURE_TENANT_ID`
   - `AZURE_SUBSCRIPTION_ID`

3. **Push code to GitHub and trigger the workflow**:
   ```bash
   terraform init
   terraform plan -var-file="terraform.tfvars"
   terraform apply -auto-approve -var-file="terraform.tfvars"
   ```

   Or simply let the GitHub Actions workflow deploy it automatically on push to `main`.

## 🎯 Why This Matters

- 🔐 **Eliminates plaintext secrets in CI/CD**  
- 📜 **Auditable**: All identity + RBAC configurations are under version control  
- ♻️ **Rotatable**: Use Key Vault to enforce secret rotation policies  
- 🧱 **Composable**: Module-ready, scalable to multiple tenants/environments

## 🔄 Extending This Setup

- Add GitHub Environments for approval gating
- Restrict federation trust using custom OIDC claims (e.g., repo name, env)
- Integrate with Bicep/Terragrunt/workload onboarding pipelines
- Repurpose this pattern for AKS pods or multi-cloud CI/CD identities


👨‍💻 Built by Swapnil Kale — passionate about secure, scalable infrastructure using Azure and Terraform.  
📬 Questions or feedback? Open an issue or connect on [LinkedIn](https://www.linkedin.com/in/swapnilnkale/).
