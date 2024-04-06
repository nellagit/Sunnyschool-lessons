output "api_invoke_url" {
  description = "URL to invoke the API Gateway"
  value       = module.lambda_api.api_invoke_url
}

