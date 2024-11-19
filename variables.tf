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