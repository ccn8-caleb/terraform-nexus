# Virtual Network

resource "azurerm_virtual_network" "main" {
  name                = "${var.identifier}-vnet"
  address_space       = ["${var.vnet_cidr_prefix}"+"${var.vnet_cidr_bits}"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

# Subnets

resource "azurerm_subnet" "vm" {
  name                 = "${var.identifier}-subnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["${var.subnet_vm_cidr_prefix}"+"${var.subnet_vm_cidr_bits}"]

# VM Network Interface

resource "azurerm_network_interface" "mainHost" {
  name                = "${var.identifier}-nic"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    subnet_id                     = azurerm_subnet.vm.id
    private_ip_address_allocation = "Dynamic"
  }
}

# VM Network Security Group

resource "azurerm_network_security_group" "mainHost" {
  name                = "${var.identifier}-nsg"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  security_rule {
    name                       = "SSH"
    description                = "Allow SSH access from specific location"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.ssh_source_address_prefix
    destination_address_prefix = "*"
  }
}

# VM Network Interface Security Group Association

resource "azurerm_network_interface_security_group_association" "mainHost" {
  network_interface_id      = azurerm_network_interface.mainHost.id
  network_security_group_id = azurerm_network_security_group.main.id
}