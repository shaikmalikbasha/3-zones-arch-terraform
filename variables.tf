# Root Varibales
variable "project_name" {
  type = string
}
variable "project_version" {
  type = string
}
variable "environment" {
  type = string
}
variable "resource_group" {
  type = string
}
variable "location" {
  type = string
}
variable "cost_center" {
  type    = string
  default = "Costrategix"
}

# Storage Account Variables
variable "st_account_tier" {
  type    = string
  default = "Standard"
}
variable "st_account_replication_type" {
  type    = string
  default = "GRS"
}
variable "st_account_kind" {
  type    = string
  default = "StorageV2"
}
variable "containers" {
  type = list(string)
}

# Function App Varibales
variable "python_version" {
  type    = number
  default = "3.8"
}
variable "service_plan_func_os_type" {
  type    = string
  default = "Linux"
}
variable "service_plan_func_sku_name" {
  type    = string
  default = "Y1"
}
variable "func_env_variables" {
  type = map(string)
}

#ADF Github Variables
variable "adf_github_account_name" {
  type     = string
  nullable = false
}
variable "adf_github_branch" {
  type     = string
  nullable = false
}
variable "adf_github_url" {
  type     = string
  nullable = false
}
variable "adf_github_repo_name" {
  type     = string
  nullable = false
}

# Azure Key Vault
variable "kv_secret_permissions" {
  type        = list(string)
  description = "List of full secret permissions, must be one or more from the following: backup, delete, get, list, purge, recover, restore and set"
  default     = ["Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"]
}
variable "kv_key_permissions" {
  type        = list(string)
  description = "List of full key permissions, must be one or more from the following: backup, create, decrypt, delete, encrypt, get, import, list, purge, recover, restore, sign, unwrapKey, update, verify and wrapKey."
  default = ["Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge",
  "Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey"]
}
variable "key_vault_sku_name" {
  type        = string
  description = "Select Standard or Premium SKU"
  default     = "standard"
}
