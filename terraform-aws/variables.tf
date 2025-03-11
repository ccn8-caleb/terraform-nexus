/* Provider Specific */

variable "region_primary" {
  description = "Primary region of resources being created"
  type        = string
  default     = "us-east-2"
}

variable "region_failover" {
  description = "Failover region of resources being created"
  type        = string
  default     = "us-west-2"
}

variable "availability_zone_primary" {
  description = "Primary availability zone of resources being created"
  type        = string
  default     = "us-east-2a"
}

/* Account Variables */

variable "account_id" {
  description = "AWS Account ID"
  type        = string
  default     = "123456789012"
}

variable "vpc_base_name" {
  description = "Name of the base VPC"
  type        = string
  default     = "ccn8-net0"
}

variable "vpc_base_cidr" {
  description = "CIDR block for the base VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Secrets should be kept outside of this variable
variable "environment_variables" {
  description = "Environment variable defaults (all uppercase)"
  type        = map(string)
  default = {
    SITE_SUBDOMAIN   = "www"
    SITE_DOMAIN      = "concatn8.com"
    APP_VERSION      = "1.1.0"
    PHP_VERSION      = "8.2"
    POSTGRES_VERSION = "17.1"
    ENVIRONMENT      = "production"
    DB_HOST          = "localhost"
    DB_PORT          = "5432"
    API_KEY          = "default_key"
    LOG_LEVEL        = "info"
    PORT             = "8080"
  }
}

variable "tags" {
  description = "Default set of tags (all lowercase)"
  type        = map(string)
  default = {
    name           = "ccn8-live"
    allocation     = "concatn8"
    sub_allocation = "admin"
    department     = "operations"
    project        = "terraform"
    environment    = "admin"
    owner          = "cwallace"
    managed_by     = "terraform"
  }
}