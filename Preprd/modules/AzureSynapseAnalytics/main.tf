resource "azurerm_sql_server" "sql_server" {
  name = var.sqlserver_name  #acs26x012
  resource_group_name = var.rgsyn #"rg-ads-eus2-pioneer-inn-armtotf"
  location = var.location
  version = var.versionsyn #"12.0"
  administrator_login = var.administrator_login_synsql #"etarrowo"
  administrator_login_password = var.administrator_login_password_synsql #"ab1@cdef"

  tags = {
    AppId = var.AppId #"TBD" 
    environment = var.environment
    DataClassification = var.DataClassification #"CONFIDENTIAL"
    Role = var.Role #"Tools"
    SupportGroup = var.SupportGroup #"ADCS.Cloud.Infrastructure"
  }
}

resource "azurerm_sql_database" "sql_dw" {
  name = var.sqldw_name #"syn-ads-eus2-edhpreprd-dev-001"
  resource_group_name = var.rgsyn#"rg-ads-eus2-pioneer-inn-armtotf"
  location = azurerm_sql_server.sql_server.location
  server_name = azurerm_sql_server.sql_server.name
  edition = var.editionsyn #"DataWarehouse"
  requested_service_objective_name = var.requested_service_objective_name #"DW100c"

  tags = {
    AppId = var.AppId #"TBD" 
    environment = var.environment
    DataClassification = var.DataClassification #"CONFIDENTIAL"
    Role = var.Role #"Tools"
    SupportGroup = var.SupportGroup #"ADCS.Cloud.Infrastructure"
  }

}


#create private_end_point1 attach private connection with SQL Server1
resource "azurerm_private_endpoint" "endpointsqlser1" {
  name                = var.sqlser_endpoint #"pep-a6X0011"
  location            = var.location
  resource_group_name = var.rgsyn #"rg-ads-eus2-pioneer-inn-armtotf"
  subnet_id           = var.synsubnet_id #"/subscriptions/eecd271c-6ad0-435b-9ff3-495957463af0/resourceGroups/rg-ads-eus2-pioneer-inn-armtotf/providers/Microsoft.Network/virtualNetworks/vnet-ads-eus2-analytics-int-edhpreprd-004/subnets/sn-ads-eus2-analytics-edhpreprd-pep-001"

  private_service_connection {
    name                           = azurerm_sql_server.sql_server.name
    private_connection_resource_id = azurerm_sql_server.sql_server.id
    is_manual_connection           = false
    subresource_names              = ["sqlServer"]
  }
  tags = {
    AppId = var.AppId #"TBD" 
    environment = var.environment
    DataClassification = var.DataClassification #"CONFIDENTIAL"
    Role = var.Role #"Tools"
    SupportGroup = var.SupportGroup #"ADCS.Cloud.Infrastructure"
  }
}