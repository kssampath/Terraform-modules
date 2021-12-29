// Create the subnets in vnet
// resource "azurerm_subnet" "public-subnet" {
//   name                 = var.vmsubnetname #"sn-ads-eus2-analytics-edhpreprd-app-001"
//   resource_group_name  = var.rgvnet
//   virtual_network_name = var.vnet #"vnet-ads-eus2-analytics-int-edhpreprd-004"
//   address_prefixes     = var.vmsb_add #["10.40.49.0/24"]
//   enforce_private_link_endpoint_network_policies = true

// }

resource "azurerm_network_interface" "main1" {
  name                = var.nicname1 #"example-nic1"
  // depends_on          = [azurerm_subnet.public-subnet]
  location            = var.location
  resource_group_name = var.rgvm

  ip_configuration {
    name                          = var.vmsubnetname #"sn-ads-eus2-analytics-edhpreprd-app-001"
    subnet_id                     = var.vmnicsub_id
    private_ip_address_allocation = var.private_ip_address_allocation #"Dynamic"
  }
}
resource "azurerm_network_interface" "main2" {
  name                =  var.nicname2 #"example-nic2"
  // depends_on          = [azurerm_subnet.public-subnet]
  location            = var.location
  resource_group_name = var.rgvm

  ip_configuration {
    name                          = var.vmsubnetname #"sn-ads-eus2-analytics-edhpreprd-app-001"
    subnet_id                     = var.vmnicsub_id
    private_ip_address_allocation = var.private_ip_address_allocation #"Dynamic"
  }
}

# Create Virtual Machine
resource "azurerm_virtual_machine" "MyMachine1" {
  name                  = var.vm1
  depends_on          = [azurerm_network_interface.main1]
  location              = var.location
  resource_group_name   = var.rgvm
  #"rg-ads-eus2-edh-dev-ctrm-001"
  network_interface_ids = [azurerm_network_interface.main1.id]
  vm_size               = var.vm_size #"Standard_E2s_v3"

  storage_image_reference {
    publisher = var.publisher #"RedHat"
    offer     = var.offer #"RHEL"
    sku       = var.sku #"7.8"  
    version   = var.version1 #"latest"
  }
  storage_os_disk {
    name              = var.os_disk1
    caching           = var.caching
    create_option     = var.create_option #"FromImage"
    managed_disk_type = var.managed_disk_type #"Premium_LRS"
    os_type = var.os_type #"Linux"
  }

  os_profile {
    computer_name = var.computer_name1 #"ACS29L018"
    admin_username = var.admin_username1 # "ctrmadmin"
    admin_password = data.azurerm_key_vault_secret.password.value
    #var.admin_password1 #"Ab@c123"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
  
tags = {
    AppId = var.AppId #"TBD" 
    environment = var.environment
    DataClassification = var.DataClassification #"CONFIDENTIAL"
    Role = var.Role #"Tools"
    SupportGroup = var.SupportGroup #"ADCS.Cloud.Infrastructure"
    }
}


resource "azurerm_managed_disk" "dataDiskResources1" {
  name                 = var.managed_disk_type_name1 #"acs29l018-datadisk-01"
  location             = var.location
  resource_group_name  = var.rgvm
  storage_account_type = var.storage_account_type #"Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "64"
  zones = ["1"]

tags = {
    AppId = var.AppId #"TBD" 
    environment = var.environment
    DataClassification = var.DataClassification #"CONFIDENTIAL"
    Role = var.Role #"Tools"
    SupportGroup = var.SupportGroup #"ADCS.Cloud.Infrastructure"
    }
}

resource "azurerm_virtual_machine_data_disk_attachment" "vm1d1" {
  managed_disk_id    = azurerm_managed_disk.dataDiskResources1.id
  virtual_machine_id = azurerm_virtual_machine.MyMachine1.id
  lun                = "0"
  caching            = "None"
}


// resource "azurerm_managed_disk" "dataDiskResources2" {
//   name                 = "acs29l018-datadisk-02"
//   location             = var.location
//   resource_group_name  = "rg-ads-eus2-pioneer-inn-armtotf"
//   storage_account_type = "Standard_LRS"
//   create_option        = "Restore"
//   disk_size_gb         = "64"
//   zones = ["1"]

// tags = {
//         AppID = "TBD"
//         SupportGroup = "ADCS.Cloud.Infrastructure"
//         Role = ""
//         DataClassification = "CONFIDENTIAL"
//         Environment = "DEV"
//     }
// }

// resource "azurerm_virtual_machine_data_disk_attachment" "vm1d2" {
//   managed_disk_id    = azurerm_managed_disk.dataDiskResources2.id
//   virtual_machine_id = azurerm_virtual_machine.MyMachine1.id
//   lun                = "0"
//   caching            = "None"
// }


resource "azurerm_virtual_machine" "MyMachine2" {
  name                  = var.vm2
  depends_on          = [azurerm_network_interface.main2]
  location              = var.location
  resource_group_name   = var.rgvm
  network_interface_ids = [azurerm_network_interface.main2.id]
  vm_size               = var.vm_size #"Standard_E2s_v3"

  storage_image_reference {
    publisher = var.publisher #"RedHat"
    offer     = var.offer #"RHEL"
    sku       = var.sku #"7.8"  
    version   = var.version1 #"latest"
  }

  storage_os_disk {
    name              = var.os_disk2
    caching           = var.caching
    create_option     = var.create_option #"FromImage"
    managed_disk_type = var.managed_disk_type #"Premium_LRS"
    os_type = var.os_type #"Linux"

  }

  os_profile {
    computer_name = var.computer_name2 #"ACS29L018"
    admin_username = var.admin_username2 # "ctrmadmin"
    admin_password = data.azurerm_key_vault_secret.password.value
    #var.admin_password2 #"Ab@c123"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
  
tags = {
    AppId = var.AppId #"TBD" 
    environment = var.environment
    DataClassification = var.DataClassification #"CONFIDENTIAL"
    Role = var.Role #"Tools"
    SupportGroup = var.SupportGroup #"ADCS.Cloud.Infrastructure"
    }
}

resource "azurerm_managed_disk" "dataDiskResources2" {
  name                 = var.managed_disk_type_name2 #"acs29l019-datadisk-01"
  location             = var.location #"eastus2"
  resource_group_name  = var.rgvm
  storage_account_type = var.storage_account_type #"Standard_LRS"
  #storage_account_type = "null"
  create_option        = "Empty"
  disk_size_gb         = "64"
  zones = ["1"]

tags = {
    AppId = var.AppId #"TBD" 
    environment = var.environment
    DataClassification = var.DataClassification #"CONFIDENTIAL"
    Role = var.Role #"Tools"
    SupportGroup = var.SupportGroup #"ADCS.Cloud.Infrastructure"
    }
}


resource "azurerm_virtual_machine_data_disk_attachment" "vm2d1" {
  managed_disk_id    = azurerm_managed_disk.dataDiskResources2.id
  virtual_machine_id = azurerm_virtual_machine.MyMachine2.id
  lun                = "0"
  caching            = "None"
}
