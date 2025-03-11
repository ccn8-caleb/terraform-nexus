variable "s3_bucket" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "mybucket"
}

variable "s3_access_key" {
  description = "The access key for the S3 bucket"
  type        = string

  validation {
    condition     = length(var.s3_access_key) > 0
    error_message = "The access key must not be empty"
  }

  sensitive = true
}

variable "region" {
  description = "The region in which the S3 bucket is located"
  type        = string
  default     = "us-east-2"
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table"
  type        = string
  default     = "mydynamodbtable"
}