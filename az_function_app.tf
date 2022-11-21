resource "azurerm_service_plan" "servicePlan" {
  name                = "ASP-${upper(var.project_name)}-${upper(var.environment)}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = var.service_plan_func_os_type
  sku_name            = var.service_plan_func_sku_name
}

resource "azurerm_application_insights" "applicationInsights" {
  name                = "appi-${lower(var.project_name)}-${var.environment}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = "web"
  sampling_percentage = 0
}

resource "azurerm_linux_function_app" "functionApp" {
  name                = "func-${lower(var.project_name)}-${var.environment}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  storage_account_name = azurerm_storage_account.appDataStorageAccount.name
  service_plan_id      = azurerm_service_plan.servicePlan.id


  app_settings = {
    WEBSITE_RUN_FROM_PACKAGE = "1",
    FUNCTIONS_WORKER_RUNTIME = "python",
    AzureWebJobsStorage      = azurerm_storage_account.appDataStorageAccount.primary_connection_string
    AzureWebJobsDashboard    = azurerm_storage_account.appDataStorageAccount.primary_connection_string
    ST_ACC_CONN_STR          = azurerm_storage_account.appDataStorageAccount.primary_connection_string
  }

  site_config {
    application_insights_key               = azurerm_application_insights.applicationInsights.instrumentation_key
    application_insights_connection_string = azurerm_application_insights.applicationInsights.connection_string
    application_stack {
      python_version = var.python_version
    }
  }

  tags = {
    "environment" = "${var.environment}"
    "costCenter"  = "${var.cost_center}"
  }

}
