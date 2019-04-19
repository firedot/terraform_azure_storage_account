# Configure the Azure Provider

provider "azurerm" {
  use_msi = true
}

# Confiugre the random_string resource that will be used to provide us with random strings

resource "random_string" "my_random_string" {
  length  = 10
  special = false
  upper   = false
}

# Because Azure Storage Account needs to be binded to a resource group, we need to
# create one, if we don't have created it previously.

resource "azurerm_resource_group" "test_resource_group" {
  name     = "${random_string.my_random_string.result}"
  location = "West US"

  tags = {
    environment = "Test"
  }
}

# Configure the Azure Storage Account Resource

resource "azurerm_storage_account" "asa_test" {
  name                     = "${random_string.my_random_string.result}"
  resource_group_name      = "${azurerm_resource_group.test_resource_group.name}"
  location                 = "West US"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "Test"
  }
}
