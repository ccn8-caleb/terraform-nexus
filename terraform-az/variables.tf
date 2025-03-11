variable "identifier" {
    description = "A unique identifier for the resources"
    type        = string
    default     = "ccn8-dev"
}

variable "region_primary" {
    description     = "The primary region in which the resources will be created"
    type            = string
    default         = "us-east-2"

    validation {
        condition     = can(regex("us-(east|west)-[0-9]", var.region_primary))
        error_message = "The primary region must be a valid AWS region"
    }
}

variable "region_failover" {
    description     = "The failover region in which the resources will be created"
    type            = string
    default         = "us-west-1"

    validation {
        condition     = can(regex("us-(east|west)-[0-9]", var.region_failover))
        error_message = "The failover region must be a valid AWS region"
    }
}

variable "resource_group_name" {
    description     = "The name of the produced resource group"
    type            = string
    default         = "ccn8-rg"
}

variable "vnet_name" {
    description     = "The name of the virtual network"
    type            = string
    default         = "ccn8-vnet"
}

variable "vnet_cidr_prefix" {
    description     = "The CIDR prefix for the virtual network"
    type            = string
    default         = "10.0.0.0"
}

variable "vnet_cidr_bits" {
    description     = "The number of bits in the CIDR prefix"
    type            = number
    default         = 16
}

variable "subnet_vm_name" {
    description     = "The name of the subnet for the VMs"
    type            = string
    default         = "vm-subnet"
}

variable "subnet_vm_cidr_prefix" {
    description     = "The CIDR prefix for the VM subnet"
    type            = string
    default         = "10.0.0.0"
}

variable "subnet_vm_cidr_bits" {
    description     = "The number of bits in the CIDR prefix"
    type            = number
    default         = 24
}

variable "vm_admin_username_secret_name" {
    description     = "The name of the secret to reference the VM admin username"
    type            = string
    default         = "vm-admin-username"
}

variable "vm_admin_password_secret_name" {
    description     = "The name of the secret to reference the VM admin password"
    type            = string
    default         = "vm-admin-password"
}

variable "key_vault_name" {
    description     = "The name of the key vault"
    type            = string
    default         = "ccn8-keyvault"
}

variable "tag_map" {
    description = "A map of tags to assign to the resources"
    type        = map(string)
    default     = {
        Environment     = "dev"
        Department      = "operations"
        Project         = "terraform"
        ManagedBy       = "terraform"
    }
}