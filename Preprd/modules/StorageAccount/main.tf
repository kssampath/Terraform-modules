terraform {
  required_version = ">= 0.12"
}


# Create a storage account
resource "azurerm_storage_account" "storage-account" {
  name                     = var.storage-name
  resource_group_name      = var.storage_rg
  location                 = var.location
  account_tier             = var.account-tier
  account_replication_type = var.replication-type
  account_kind             = var.storage-kind
  min_tls_version          = var.storage-tls
  is_hns_enabled           = true
  enable_https_traffic_only = true 
  allow_blob_public_access = false
  network_rules {
   # bypass = "AzureServices"
    default_action          = "Allow"
  }
  tags = {
    AppId = var.AppId #"TBD" 
    environment = var.environment
    DataClassification = var.DataClassification #"CONFIDENTIAL"
    Role = var.Role #"Tools"
    SupportGroup = var.SupportGroup #"ADCS.Cloud.Infrastructure"
  }
}

resource "azurerm_private_endpoint" "endpoint-blob" {
  name                = var.privateendpointnameBlob
  location            = var.location
  resource_group_name = var.storage_rg
  subnet_id           = var.storsubnet_id

  private_service_connection {
    name                           = azurerm_storage_account.storage-account.name
    private_connection_resource_id = azurerm_storage_account.storage-account.id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }
  tags = {
    AppId = var.AppId #"TBD" 
    environment = var.environment
    DataClassification = var.DataClassification #"CONFIDENTIAL"
    Role = var.Role #"Tools"
    SupportGroup = var.SupportGroup #"ADCS.Cloud.Infrastructure"
  }
}

resource "azurerm_private_endpoint" "endpoint-dfs" {
  name                = var.privateendpointnamedfs
  location            = var.location
  resource_group_name = var.storage_rg
  subnet_id           = var.storsubnet_id

  tags = {
    AppId = var.AppId #"TBD" 
    environment = var.environment
    DataClassification = var.DataClassification #"CONFIDENTIAL"
    Role = var.Role #"Tools"
    SupportGroup = var.SupportGroup #"ADCS.Cloud.Infrastructure"
  }

  private_service_connection {
    name                           = azurerm_storage_account.storage-account.name
    private_connection_resource_id = azurerm_storage_account.storage-account.id
    is_manual_connection           = false
    subresource_names              = ["dfs"]
    }
}


resource "azurerm_private_endpoint" "endpoint-table" {
  name                = var.privateendpointnametb
  location            = var.location
  resource_group_name = var.storage_rg
  subnet_id           = var.storsubnet_id

  tags = {
    AppId = var.AppId #"TBD" 
    environment = var.environment
    DataClassification = var.DataClassification #"CONFIDENTIAL"
    Role = var.Role #"Tools"
    SupportGroup = var.SupportGroup #"ADCS.Cloud.Infrastructure"
  }

  private_service_connection {
    name                           = azurerm_storage_account.storage-account.name
    private_connection_resource_id = azurerm_storage_account.storage-account.id
    is_manual_connection           = false
    subresource_names              = ["table"]
    }
}


resource "azurerm_private_endpoint" "endpoint-file" {
  name                = var.privateendpointnamefile
  location            = var.location
  resource_group_name = var.storage_rg
  subnet_id           = var.storsubnet_id

  tags = {
    AppId = var.AppId #"TBD" 
    environment = var.environment
    DataClassification = var.DataClassification #"CONFIDENTIAL"
    Role = var.Role #"Tools"
    SupportGroup = var.SupportGroup #"ADCS.Cloud.Infrastructure"
  }

  private_service_connection {
    name                           = azurerm_storage_account.storage-account.name
    private_connection_resource_id = azurerm_storage_account.storage-account.id
    is_manual_connection           = false
    subresource_names              = ["file"]
    }
}

resource "azurerm_private_endpoint" "endpoint-queue" {
  name                = var.privateendpointnamequ
  location            = var.location
  resource_group_name = var.storage_rg
  subnet_id           = var.storsubnet_id

  tags = {
    AppId = var.AppId #"TBD" 
    environment = var.environment
    DataClassification = var.DataClassification #"CONFIDENTIAL"
    Role = var.Role #"Tools"
    SupportGroup = var.SupportGroup #"ADCS.Cloud.Infrastructure"
  }

  private_service_connection {
    name                           = azurerm_storage_account.storage-account.name
    private_connection_resource_id = azurerm_storage_account.storage-account.id
    is_manual_connection           = false
    subresource_names              = ["queue"]
    }
}
