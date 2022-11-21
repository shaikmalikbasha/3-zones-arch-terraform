resource "azurerm_data_factory" "az_datafactory" {

  name                = "ADF-${upper(var.project_name)}-${upper(var.environment)}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  #   github_configuration {
  #     account_name    = var.adf_github_account_name
  #     branch_name     = var.adf_github_branch
  #     git_url         = var.adf_github_url
  #     repository_name = var.adf_github_repo_name
  #     root_folder     = "/"
  #   }
  #   github_configuration {
  #     account_name    = "Costrategix"
  #     branch_name     = "adf_developmemt_dev"
  #     repository_name = "GL2-ADFRepository"
  #     root_folder     = "/"
  #   }
  tags = {
    "environment" = "${var.environment}"
    "costCenter"  = "${var.cost_center}"
  }
}
