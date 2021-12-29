# Configure the Azure provider
provider "azurerm" { 
  environment = "public"
  skip_provider_registration = true
  version = ">= 2.0.0"
  features {}  
}