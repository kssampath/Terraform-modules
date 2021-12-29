variable "location" {
  default = "eastus2"
}

variable "environment" {
  type = string
  description = "The environment to be built"
  default = "dev"
}

variable "datafactory_name" {
  type = string
  description = "datafactory name"
#  default = "adf-ads-eus2-edhpreprd-dev-002"
}

variable "rgdfac" {
  description = "Resource group name"
#  default = "rg-ads-eus2-pioneer-inn-armtotf"
}

variable "datafactory_endpointname" {
  type = string
  description = "datafactory private endpoint name"
#  default = "pep-adf-ads-eus2-edhpreprd-dev-001"
}

variable "dfacsubnet_id" {
  type = string
  description = "The subnet_id"
#  default = "/subscriptions/eecd271c-6ad0-435b-9ff3-495957463af0/resourceGroups/rg-ads-eus2-pioneer-inn-armtotf/providers/Microsoft.Network/virtualNetworks/vnet-ads-eus2-analytics-int-edhpreprd-004/subnets/sn-ads-eus2-analytics-edhpreprd-pep-001"
}


variable "AppId" {
  type = string
  description = "The AppId"
#  default = "TBD" 
}

variable "DataClassification" {
  type = string
  description = "The DataClassification"
#  default = "CONFIDENTIAL"
}

variable "Role" {
  type = string
  description = "The Role"
#  default = "Tools"
}

variable "SupportGroup" {
  type = string
  description = "The SupportGroup"
#  default = "ADCS.Cloud.Infrastructure"
}
