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

variable "environment_variables" {
  description = "Environment variable defaults (all uppercase)"
  type        = map(string)
  default     = {
    SITE_SUBDOMAIN     = "www"
    SITE_DOMAIN        = "concatn8.com"
    APP_VERSION        = "1.1.0"
    PHP_VERSION        = "8.2"
    ENVIRONMENT        = "production"
    DB_HOST            = "localhost"
    DB_PORT            = "5432"
    DB_USER            = "default_user"
    DB_PASSWORD        = "default_password"
    API_KEY            = "default_key"
    LOG_LEVEL          = "info"
    PORT               = "8080"
  }
}

variable "tags" {
  description = "Default set of tags (all lowercase)"
  type        = map(string)
  default     = {
    name              = "ccn8-live"
    allocation        = "concatn8"
    sub_allocation    = "admin"
    department        = "operations"
    project           = "terraform"
    environment       = "admin"
    owner             = "cwallace"
    managed_by        = "terraform"
  }
}