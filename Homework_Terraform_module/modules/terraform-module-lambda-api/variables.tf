variable "function_name" {}
variable "name" {
  description = "API Gateway for Lambda function"
}

variable "stage_name" {
  description = "Name of the API Gateway stage"
  type        = string
}

variable "region" {}
variable "accountId" {}