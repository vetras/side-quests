# Mandatory 

variable "elb_arn" {
  type        = string
  description = "The ARN for the ELB service account to use"
}

variable "bucket_name" {
  type        = string
  description = "The name for the S3 bucket"
}

# Optional

variable "common_tags" {
  type        = map(string)
  description = "The map of tags to add to all resources"
  default     = {}
}

variable "alb_logs_folder" {
  type        = string
  description = "The name for the logs folder to be set in the S3 bucket"
  default     = "alb-logs"
}
