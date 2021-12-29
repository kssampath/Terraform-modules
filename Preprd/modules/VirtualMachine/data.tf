data "azurerm_key_vault" "key_vault" {
  name                = "keyytest"
  resource_group_name = "prrg88"
}

data "azurerm_key_vault_secret" "password" {
  depends_on = [data.azurerm_key_vault.key_vault]
  name         = "sample" #var.keyvault_secret_name
  key_vault_id = data.azurerm_key_vault.key_vault.id
}