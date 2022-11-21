# Create Azure Key vault
data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "az_key_vault" {
  name                = "${var.project_name}-Key-Vault-${var.environment}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = var.key_vault_sku_name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  tags = {
    "environment" = "${var.environment}"
    "costCenter"  = "${var.cost_center}"
  }
}

# Create a Default Azure Key Vault access policy with Admin permissions
# This policy must be kept for a proper run of the "destroy" process
resource "azurerm_key_vault_access_policy" "az_kv_access_policy" {
  key_vault_id = azurerm_key_vault.az_key_vault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  key_permissions    = var.kv_key_permissions
  secret_permissions = var.kv_secret_permissions
}
