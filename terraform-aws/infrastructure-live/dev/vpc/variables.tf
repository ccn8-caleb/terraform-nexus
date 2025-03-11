variable "region_primary" {
    description = "The primary region in which the resources will be created"
    type        = string
    default     = "us-east-2"
}

variable "region_failover" {
    description = "The failover region in which the resources will be created"
    type        = string
    default     = "us-west-1"
}

variable "vpc_name" {
    description = "The name of the VPC"
    type        = string
    default     = "myvpc"
}

variable "vpc_cidr_prefix" {
    description = "The CIDR prefix for the VPC"
    type        = string
    default     = "10.0.0.0"
}

variable "vpc_cidr_bits" {
    description = "The number of bits in the CIDR prefix"
    type        = number
    default     = 16
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