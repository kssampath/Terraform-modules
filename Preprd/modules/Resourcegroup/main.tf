terraform {
  required_version = ">= 0.12"
}
# Create a resource group
resource "azurerm_resource_group" "resource-group" {
  count = length(var.resource-group)
  name = var.resource-group[count.index]
  location = var.location
  tags = {
    AppId = var.AppId 
    environment = var.environment
    DataClassification = var.DataClassification
    Role = var.Role
    SupportGroup = var.SupportGroup 
  }
}