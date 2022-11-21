project_name    = "PROJECT-NAME"
project_version = "V01"
environment     = "dev"
resource_group  = "PROJECT-RG"
location        = "East US"
cost_center     = "CostCenterForProject"

# Storage Account Configs
st_account_tier             = "Standard"
st_account_replication_type = "LRS"
st_account_kind             = "StorageV2"
containers                  = ["container_name_1"]

# Function App Configs
python_version             = 3.8
service_plan_func_os_type  = "Linux"
service_plan_func_sku_name = "Y1"

# ADF Configs
adf_github_account_name = "shaikmalikbasha"
adf_github_branch       = "adf_development_dev"
adf_github_url          = "https://github.com"
adf_github_repo_name    = "RepoName"

#Azure Key Value
kv_secret_permissions = ["Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"]
kv_key_permissions = [
  "Backup", "Create", "Decrypt", "Delete",
  "Encrypt", "Get", "Import", "List", "Purge",
  "Recover", "Restore", "Sign", "UnwrapKey",
"Update", "Verify", "WrapKey"]
key_vault_sku_name = "standard"

