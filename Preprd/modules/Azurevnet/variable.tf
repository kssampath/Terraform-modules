variable "location" {}
variable "rgvnet" {}
variable "address_space_vnet1" {}
variable "subnet_name1" {
  type = string
  description = "The subnet name"
  #default = "sn-ads-eus2-analytics-edhpreprd-pep-001"
}

variable "vnet_name" {
  type = string
  description = "The vnet name"
  #default = "vnet-ads-eus2-analytics-int-edhpreprd-004"
}

variable "address_prefixes_sub1" {
  type = string
  description = "The address_prefix "
  #default = "10.40.52.0/26"
}
