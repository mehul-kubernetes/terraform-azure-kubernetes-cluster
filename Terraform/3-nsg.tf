resource "azurerm_network_security_group" "project-az-nsg01" {
  name                = "project-az-nsg01"
  location            = azurerm_resource_group.project-az-rg01.location
  resource_group_name = azurerm_resource_group.project-az-rg01.name

  tags = {
    Name = "project-az-nsg01"
  }
}

# Attach Security Rule to NSG
resource "azurerm_network_security_rule" "project-az-nsg01-ssh" {
  name                        = "allow-ssh"
  priority                    = 1001
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "22"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
  resource_group_name         = azurerm_resource_group.project-az-rg01.name
  network_security_group_name = azurerm_network_security_group.project-az-nsg01.name
}


