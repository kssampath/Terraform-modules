// Create the virtual network
resource "azurerm_virtual_network" "virtual-network" {
  name                = var.vnet_name #"vnet-ads-eus2-analytics-int-edhpreprd-004"
  address_space       = var.address_space_vnet1 #["10.40.48.0/20"]
  location            = var.location #"eastus2" 
  resource_group_name = var.rgvnet #"rg-ads-eus2-pioneer-inn-armtotf"
 
}
// Create the subnets in vnet
resource "azurerm_subnet" "public-subnet1" {
  name                 = var.subnet_name1 #"sn-ads-eus2-analytics-edhpreprd-pep-001"
  depends_on          = [azurerm_virtual_network.virtual-network]
  resource_group_name  = var.rgvnet
  virtual_network_name = var.vnet_name #"vnet-ads-eus2-analytics-int-edhpreprd-004"
  address_prefix     = var.address_prefixes_sub1  #"10.40.52.0/26"
  enforce_private_link_endpoint_network_policies = true
}

resource "azurerm_subnet" "public-subnet2" {
  name                 = var.subnet_name1 #"sn-ads-eus2-analytics-edhpreprd-pep-001"
  depends_on          = [azurerm_virtual_network.virtual-network]
  resource_group_name  = var.rgvnet
  virtual_network_name = var.vnet_name #"vnet-ads-eus2-analytics-int-edhpreprd-004"
  address_prefix     = var.address_prefixes_sub2  #"10.40.52.0/26"
  enforce_private_link_endpoint_network_policies = true
}

resource "azurerm_subnet" "public-subnet3" {
  name                 = var.subnet_name1 #"sn-ads-eus2-analytics-edhpreprd-pep-001"
  depends_on          = [azurerm_virtual_network.virtual-network]
  resource_group_name  = var.rgvnet
  virtual_network_name = var.vnet_name #"vnet-ads-eus2-analytics-int-edhpreprd-004"
  address_prefix     = var.address_prefixes_sub3  #"10.40.52.0/26"
  enforce_private_link_endpoint_network_policies = true
}

