
# storage name 
variable "storage-name" {
  type = string
  description = "default storage account name"
  #default = "dls2adseus2dstkpreprddeve01"
}
variable "storsubnet_id" {
  type = string
  description = "The subnet_id"
#  default = "/subscriptions/eecd271c-6ad0-435b-9ff3-495957463af0/resourceGroups/rg-ads-eus2-pioneer-inn-armtotf/providers/Microsoft.Network/virtualNetworks/vnet-ads-eus2-analytics-int-edhpreprd-004/subnets/sn-ads-eus2-analytics-edhpreprd-pep-001"
}
# storage environment
variable "environment" {
  type = string
  description = "The environment to be built"
  #default = "dev"
}

# azure region
variable "location" {
  type = string
  description = "Azure region where resources will be created"
  #default = "eastus2"
}

variable "storage_rg" {
  type = string
  description = "Resource group name of Storage_account"
  #default = "rg-ads-eus2-dstkpreprd-dev-001"
}
variable "account-tier" {
  type = string
  description = "The account tier"
  #default = "Standard"
}
variable "replication-type" {
  type = string
  description = "The replication type"
  #default = "ZRS"
}
variable "storage-kind" {
  type = string
	description = "The storage kind"
  #default = "StorageV2"
}
variable "storage-tls" {
  type = string
	description = "The storage tls"
  #default = "TLS1_2"
}
variable "privateendpointnameBlob" {
  type = string
  description = "The privateend point of Blob"
  #default = "pep-dls2-blob-ads-eus2-edhpreprd-dev-001"
}
variable "privateendpointnamedfs" {
  type = string
  description = "The privateend point of dfs"
  #default = "pep-dls2-blob-ads-eus2-edhpreprd-dev-001"
}
variable "privateendpointnametb" {
  type = string
  description = "The privateend point of table"
  #default = "pep-dls2-blob-ads-eus2-edhpreprd-dev-001"
}
variable "privateendpointnamefile" {
  type = string
  description = "The privateend point of file"
  #default = "pep-dls2-blob-ads-eus2-edhpreprd-dev-001"
}
variable "privateendpointnamequ" {
  type = string
  description = "The privateend point of Queue"
  #default = "pep-dls2-blob-ads-eus2-edhpreprd-dev-001"
}
// variable "subnetid" {
//   type = string
//   #default = "/subscriptions/8987b447-d083-481e-9c0f-f2b73a15b18b/resourceGroups/rg-ads-eus2-dstk-dev-001/providers/Microsoft.Network/virtualNetworks/rg-ads-eus2-dstk-dev-001-network/subnets/rg-ads-eus2-edhpreprd-dev-001-subnet"
// }

variable "AppId" {
  type = string
  description = "The AppId"
  #default = "TBD" 
}

variable "DataClassification" {
  type = string
  description = "The DataClassification"
  #default = "CONFIDENTIAL"
}

variable "Role" {
  type = string
  description = "The Role"
  #default = "Tools"
}

variable "SupportGroup" {
  type = string
  description = "The SupportGroup"
  #default = "ADCS.Cloud.Infrastructure"
}
