variable "bucket_name" {
    default = "xfusion-s3-824428551"
    description = "s3 bucket name"
    type = string
}

variable "acl" {
    default = "public-read"
    description = "acl access"
    type = string
}

variable "block_public_acls" {
    default = false
    description = "value determines to enable public acls"
    type = bool
}

variable "ignore_public_acls" {
    default = false
    description = "value determines to ignore public acls"
    type = bool
}

variable "block_public_policy" {
    default = false
    description = "value determines to block public policies"
    type = bool
}

variable "restrict_public_buckets" {
    default = false
    description = "value determines to restrict public bucket policies"
    type = bool
}
