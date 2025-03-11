variable "s3_bucket" {
    description     = "The name of the S3 bucket"
    type            = string
    default         = "mybucket"
}

variable "tag_map" {
    description = "A map of tags to assign to the bucket"
    type        = map(string)
    default     = {
        Environment     = "admin"
        Department      = "operations"
        Project         = "terraform"
        ManagedBy       = "terraform"
    }
}