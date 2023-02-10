variable "myBucket" {
    description = "Name of the bucket resource to be provisioned"
    type        = string
    default     = "www.iac.everlycloud.tk"
}

variable "s3_origin_id" {
    description = "CloudFront Origin identifier" 
    default     = "eveOriginRandomIdentifier"
}