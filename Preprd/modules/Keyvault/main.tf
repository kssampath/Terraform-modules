 data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  name                        = var.key_vault_name #"kvadseus2edhpreprd1"
  location                    = var.location
  resource_group_name         = var.rgkv
  enabled_for_disk_encryption = false
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = var.purge_protection_enabled #false
  enabled_for_deployment      = true
  enabled_for_template_deployment = true
  sku_name                    = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = var.key_permissions
    secret_permissions = var.secret_permissions

  }
   
}

resource "azurerm_private_endpoint" "key-vault-pep" {
  name                 = var.key_vault_end_point_name # "pep-kv-ads-eus2-edhpreprd-dev-001"
  location             = var.location
  resource_group_name  = "rg-ads-eus2-pioneer-inn-armtotf"
  subnet_id            = var.kvsubnet_id #"/subscriptions/eecd271c-6ad0-435b-9ff3-495957463af0/resourceGroups/rg-ads-eus2-pioneer-inn-armtotf/providers/Microsoft.Network/virtualNetworks/vnet-ads-eus2-analytics-int-edhpreprd-004/subnets/sn-ads-eus2-analytics-edhpreprd-pep-001"
  
  private_service_connection {
    name                           = azurerm_key_vault.key_vault.name
    is_manual_connection           = false
    private_connection_resource_id = azurerm_key_vault.key_vault.id
    subresource_names              = ["vault"]
  }
  
  tags = {
    AppId = var.AppId 
    environment = var.environment
    DataClassification = var.DataClassification
    Role = var.Role
    SupportGroup = var.SupportGroup 
  }
}