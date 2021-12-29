variable "location" {
  type = string
  default = "eastus2"
}

variable "linux_fx_version" {
  type = string
}

variable "ftps_state" {
#  type = string
} 

variable "http2_enabled" {
  type = string
} 

variable "php_version" {
  type = string
} 

variable "python_version" {
  type = string
} 

variable "dotnet_framework_version" {
  type = string
}
variable "rgappser" {
  type = string
}
variable "appServPlanName" {
  description = "Name of the app service plan"
}
variable "appServPlanTier" {
  description = "app service plan's tier"
}
variable "appServPlanSKU" {
  description = "app service plan's instance size"
}
variable "kind" {
  description = "The kind of the App Service Plan to create. Possible values are Windows (also available as App), Linux, elastic (for Premium Consumption) and FunctionApp (for a Consumption Plan). Defaults to Windows. Changing this forces a new resource to be created."
}
variable "environment" {
  type = string
  description = "The environment to be built"
  default = "dev"
}

variable "appser_sql_server_name" {
  type = string
  description = "The name of the database."
}

variable "administrator_login_appser" {
  type = string
  description = "Specifies the name of the SQL administrator."
}

variable "sql_server_version_appser" { 
  type = string
}

variable "sql_storage_appser"{
  type = string
}
variable "appsersqldb_name"{
  type = string
}

variable "appser_sqldb1" {
    type = string
}
variable "sql_redundancy_appser" {
#    type = string
}

#Variables for azurerm_app_service
variable "appServiceName1" {
  type = string
  description = "Name of the app service 1"
}

variable "appServiceName2" {
  type = string
  description = "Name of the app service 2"
}


variable "appsersubnet_id" {
  type = string
}


variable "appser_endpoint" {
  type = string
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

