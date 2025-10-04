# Secrets Management Convention

## Azure Key Vault Naming Convention
- **Key Vault Name:** `vs-infra-<environment>` (e.g., `vs-infra-dev`, `vs-infra-prod`)
- **Secret Names:** Use `<module>-<secret>-<client>-<environment>`
  - Example: `postgresql-admin-password-demo-dev`

---

## Safe Variables per Module

### AKS
- No sensitive variables by default (use managed identities and Azure AD integration for cluster access).

### PostgreSQL
- `administrator_login` (safe to log)
- `administrator_password` (**secret**)
- `database` (safe)

### RabbitMQ
- `username` (safe)
- `password` (**secret**)

### RedisCache
- `password` (**secret**)

### App
- `app_secret_key` (**secret**, if used)
- `connection_strings` (**secret**)

---


## Pipeline/Library Variables (for backend and secrets)

| Variable Name              | Description                                 | Example Value         |
|---------------------------|---------------------------------------------|----------------------|
| TF_BACKEND_RG_NAME        | Terraform backend resource group name        | rg-terraform         |
| TF_STORAGE_ACCOUNT        | Terraform backend storage account name       | mystorageaccount     |
| TF_BACKEND_CONTAINER      | Terraform backend container name             | tfstate              |
| ARM_CONNECTION            | Azure service connection name                | MyAzureConnection    |

## Vault/Library Variables (to be stored in Azure Key Vault)

| Secret Name                                 | Description                        | Example Value         |
|---------------------------------------------|------------------------------------|----------------------|
| postgresql-admin-password-demo-dev          | PostgreSQL admin password          | <random>             |
| rabbitmq-password-demo-dev                  | RabbitMQ password                  | <random>             |
| rediscache-password-demo-dev                | Redis password                     | <random>             |
| app-secret-key-demo-dev                     | App secret key                     | <random>             |
| app-connection-string-demo-dev              | App DB connection string           | <connection string>  |

> **Note:** Replace `demo` and `dev` with your client/environment as needed.

---

## Usage in Pipelines
- Use the Azure Key Vault task to fetch secrets at the start of the pipeline.
- Map secrets to pipeline/library variables (e.g., `pg_admin_password`, `rabbitmq_password`).
- Pass secrets to Terraform using the `vars` input in `TerraformTaskV5`:
  ```yaml
  vars: |
    pg_admin_password=$(pg_admin_password)
    rabbitmq_password=$(rabbitmq_password)
    # ...other secrets
  ```
- Pass secrets to Helm as `--set` arguments or via extra values files generated at runtime:
  ```yaml
  - script: |
      helm upgrade --install ... \
        --set postgresql.password=$(pg_admin_password) \
        --set rabbitmq.password=$(rabbitmq_password)
  ```

---

## Example Azure Key Vault Task (YAML)
```yaml
- task: AzureKeyVault@2
  inputs:
    azureSubscription: '$(ARM_CONNECTION)'
    KeyVaultName: 'vs-infra-$(Environment)'
    SecretsFilter: '*'
    RunAsPreJob: true
```

---

## Example Secret Injection
- **TerraformTaskV5:**
  ```yaml
  - task: TerraformTaskV5@5
    displayName: 'Terraform Apply'
    inputs:
      provider: 'azurerm'
      command: 'apply'
      workingDirectory: 'terraform/environments/$(Environment)'
      environmentServiceNameAzureRM: '$(ARM_CONNECTION)'
      vars: |
        pg_admin_password=$(pg_admin_password)
        rabbitmq_password=$(rabbitmq_password)
        # ...other secrets
  ```
- **Helm:**
  ```yaml
  - script: |
      helm upgrade --install ... \
        --set postgresql.password=$(pg_admin_password) \
        --set rabbitmq.password=$(rabbitmq_password)
  ```
```
