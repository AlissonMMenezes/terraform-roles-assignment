data "azurerm_data_factory" "df" {
  name                = var.data_factory_name
  resource_group_name = var.resource_group_name
}

data "azurerm_storage_account" "sa"{
    name                = var.storage_account_name
    resource_group_name = var.resource_group_name
}

data azurerm_key_vault "kv"{
    name                = var.key_vault_name
    resource_group_name = var.resource_group_name
}

resource "azurerm_role_assignment" "df_to_sa" {
  scope                = data.azurerm_storage_account.sa.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = data.azurerm_data_factory.df.identity[0].principal_id
}

resource "azurerm_key_vault_access_policy" "df_to_kv" {
  key_vault_id = data.azurerm_key_vault.kv.id
  tenant_id    = data.azurerm_data_factory.df.identity[0].tenant_id
  object_id    = data.azurerm_data_factory.df.identity[0].principal_id

  secret_permissions = [
    "Get",
    "List"
  ]
}