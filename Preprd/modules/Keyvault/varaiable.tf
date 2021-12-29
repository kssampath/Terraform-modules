variable "key_vault_name" {
    description = "Specifies the name of the Key Vault"
}

variable "rgkv" {
    description = "Resource group of  Keyvault"
}

variable "location" {
  type = string
  default = "eastus2"
}

variable "environment" {
  type = string
  description = "The environment to be built"
  default = "dev"
}


variable "key_vault_end_point_name" {
  
}

variable "purge_protection_enabled" {
  
}

variable "kvsubnet_id" {
  
}


variable "key_permissions" {
  
}

variable "secret_permissions" {
  
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
