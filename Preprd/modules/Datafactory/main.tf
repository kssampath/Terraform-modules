resource "azurerm_data_factory" "terraform-demo-factory" {
  name                = var.datafactory_name
  #"adf-ads-eus2-edhpreprd-dev-002"
  location            = var.location
  resource_group_name = var.rgdfac
}
  /*
  identity {
    type = "SystemAssigned"
    principalId = "3ab95fff-9ded-471a-b672-48f78f16a380"
    tenantId = "7a24eae8-33b9-449a-83f5-361634c821ce"
  }
  */
  /*
  github_configuration {
    account_name = "https://dev.azure.com/cardservices"
    branch_name = "adf_publish"
    #git_url = ""
    repository_name = "EnterprisedatahubIaC"
    root_folder = "/adfpipelines"
  }
*/
/*
  github_configuration {
    account_name = "https://dev.azure.com/honlov"
    branch_name = "main"
    git_url = "https://dev.azure.com/honlov"
    repository_name = "newdatafactoryAR2TF"
    root_folder = "/adfpipelines"
  }
  tags = {
    AppId = "TBD" 
    environment = var.environment
    DataClassification = "CONFIDENTIAL"
    Role = ""
    SupportGroup = "ADCS.Cloud.Infrastructure"
  }
}
*/
resource "azurerm_private_endpoint" "datafactory-pep" {
  #count               = var.enable_datafactory_pep == true ? 1 : 0
  name                =  var.datafactory_endpointname
  #"pep-adf-ads-eus2-edhpreprd-dev-001"
  location            = var.location
  resource_group_name = var.rgdfac
  subnet_id           = var.dfacsubnet_id
  #"/subscriptions/eecd271c-6ad0-435b-9ff3-495957463af0/resourceGroups/rg-ads-eus2-pioneer-inn-armtotf/providers/Microsoft.Network/virtualNetworks/vnet-ads-eus2-analytics-int-edhpreprd-004/subnets/sn-ads-eus2-analytics-edhpreprd-pep-001"

  private_service_connection {
    name                           = azurerm_data_factory.terraform-demo-factory.name
    is_manual_connection           = false
    private_connection_resource_id = azurerm_data_factory.terraform-demo-factory.id
    subresource_names              = ["dataFactory"]
  }
  tags = {
    AppId = var.AppId #"TBD" 
    environment = var.environment
    DataClassification = var.DataClassification #"CONFIDENTIAL"
    Role = var.Role #"Tools"
    SupportGroup = var.SupportGroup #"ADCS.Cloud.Infrastructure"
  }
}
