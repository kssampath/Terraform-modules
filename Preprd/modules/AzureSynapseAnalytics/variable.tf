variable "location" {
  #default = "eastus2"
}

variable "environment" {
  type = string
  description = "The environment to be built"
  #default = "dev"
}

variable "rgsyn" {
  description = "Resource group name"
  #default = "rg-ads-eus2-pioneer-inn-armtotf"
}

variable "sqlserver_name" {
  type = string
  description = "The sqlserver name"
  #default = "acs26x012"
}

variable "versionsyn" {
  type = string
  description = "The environment to be built"
  #default = "12.0"
}

variable "administrator_login_synsql" {
  type = string
  description = "The administrator_login"
  #default = ""
}

variable "administrator_login_password_synsql" {
  type = string
  description = "The administrator_login_password"
  #default = "dev"
}

variable "sqldw_name" {
  type = string
  description = "The sql datawarehouse name"
  #default = "syn-ads-eus2-edhpreprd-dev-001"
}

variable "editionsyn" {
  type = string
  description = "The edition"
  #default = "DataWarehouse"
}

variable "sqlser_endpoint" {
  type = string
  description = "The sqlserver private endpoint"
  #default = "pep-a6X0011"
}
variable "requested_service_objective_name" {
  type = string
}
variable "synsubnet_id" {
  type = string
  description = "The subnet_id"
  #default = "/subscriptions/eecd271c-6ad0-435b-9ff3-495957463af0/resourceGroups/rg-ads-eus2-pioneer-inn-armtotf/providers/Microsoft.Network/virtualNetworks/vnet-ads-eus2-analytics-int-edhpreprd-004/subnets/sn-ads-eus2-analytics-edhpreprd-pep-001"
}


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
