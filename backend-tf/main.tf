resource azurerm_resource_group main {
  name     = "rg-tfstate"
  location = var.location
}

resource random_string main {
  length           = 8
  upper            = false
  special          = false
}

resource azurerm_storage_account main {
  name                     = "st${random_string.main.result}"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource azurerm_storage_container tfstate {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.main.id
  container_access_type = "private"
}