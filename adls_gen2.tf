resource "azurerm_storage_account" "appDataStorageAccount" {
  name                     = "testingdlforpocdl"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.st_account_tier
  account_replication_type = var.st_account_replication_type
  account_kind             = var.st_account_kind
  is_hns_enabled           = true

  tags = {
    "environment" = "${var.environment}"
    "costCenter"  = "${var.cost_center}"
  }
}

resource "azurerm_storage_data_lake_gen2_filesystem" "gen" {
  name               = each.value
  storage_account_id = azurerm_storage_account.appDataStorageAccount.id
  for_each           = toset(var.containers)
}

resource "azurerm_storage_data_lake_gen2_path" "path" {
  path               = var.project_version
  filesystem_name    = azurerm_storage_data_lake_gen2_filesystem.gen[each.value].name
  storage_account_id = azurerm_storage_account.appDataStorageAccount.id
  resource           = "directory"
  for_each           = toset(var.containers)
}
