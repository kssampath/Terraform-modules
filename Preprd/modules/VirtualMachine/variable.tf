# storage environment
variable "environment" {
  type = string
  description = "The environment to be built"
  default = "dev"
}

variable "vmnicsub_id" {
  type = string
  description = "The vmnicsubnet_id"
  default = ""
}
variable "vmsubnetname" {
  type = string
  description = "The subnet name"
  default = ""
}

variable "rgvm" {
  type = string
  description = "The Resourse group of VM"
  default = ""
}

// variable "rgvnet" {
//   type = string
//   description = "The Resourse group of Vnet"
//   default = ""
// }

// variable "vnet" {
//   type = string
//   description = "The vnet name"
//   default = ""
// }

// variable "vmsb_add" {
//   type = list
//   description = "The address vmsb prefixes"
//   #default = ""
// }

variable "nicname1" {
  type = string
  description = "The nic1 name"
  default = ""
}

variable "nicname2" {
  type = string
  description = "The nic2 name"
  default = ""
}

variable "private_ip_address_allocation" {
  type = string
  description = "The private_ip_address_allocation"
  default = ""
}

variable "vm_size" {
  type = string
  description = "The vm size"
  default = ""
}

variable "publisher" {
  type = string
  description = "The publisher"
  default = ""
}
variable "offer" {
  type = string
  description = "The offer"
  default = ""
}
variable "sku" {
  type = string
  description = "The sku"
  default = ""
}
variable "version1" {
  type = string
  description = "The version"
  default = ""
}
# azure region
variable "location" {
  type = string
  description = "Azure region where resources will be created"
  default = "eastus2"
}
## resource group name
variable "caching" {
  type = string
  description = "Resource group name"
  default = "ReadWrite"
}


variable "os_disk1" {
  type = string
  description = "storage_os_disk name"
  #default = "acs29l018-osdisk-20210805-181232"
}
variable "create_option" {
  type = string
  description = "The create option"
  default = ""
}
variable "managed_disk_type" {
  type = string
  description = "The managed disk type"
  default = ""
}
variable "managed_disk_type_name2" {
  type = string
  description = "The managed disk type"
  default = ""
}
variable "os_type" {
  type = string
  description = "The os type"
 default = ""
}
variable "computer_name1" {
  type = string
  description = "The computer name1"
 default = ""
}
variable "admin_username1" {
  type = string
  description = "The admin username"
 default = ""
}
variable "admin_password1" {
  type = string
  description = "The admin password"
 default = ""
}
variable "computer_name2" {
  type = string
  description = "The computer name2"
 default = ""
}
variable "admin_username2" {
  type = string
  description = "The admin username2"
 default = ""
}
variable "admin_password2" {
  type = string
  description = "The admin password2"
 default = ""
}

variable "managed_disk_type_name1" {
  type = string
  description = "The disk name"
 default = ""
}
variable "storage_account_type" {
  type = string
  description = "The storage account type"
 default = ""
}

variable "os_disk2" {
  type = string
  description = "storage_os_disk name"
 # default = "acs29l018-osdisk-20210805-181232"
}

// variable "os_disk3" {
//   type = string
//   description = "storage_os_disk name"
//  # default = "acs29l018-osdisk-20210805-181232"
// }

variable "vm1" {
  type = string
  description = "virtual machine name 1"
  default = "ACS29L018"
}

variable "vm2" {
  type = string
  description = "virtual machine name 2"
  default = "ACS29L019"
}
variable "AppId" {
  type = string
  description = "The AppId"
  default = "TBD" 
}

variable "DataClassification" {
  type = string
  description = "The DataClassification"
  default = "CONFIDENTIAL"
}

variable "Role" {
  type = string
  description = "The Role"
  default = "Tools"
}

variable "SupportGroup" {
  type = string
  description = "The SupportGroup"
  default = "ADCS.Cloud.Infrastructure"
}


// variable "KeyVaultname" {
//   type = string
// }

// variable "KeyVault_RG" {
//   type = string
// }

