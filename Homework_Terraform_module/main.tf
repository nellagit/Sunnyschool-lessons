module "lambda_api" {
  source        = "./modules/terraform-module-lambda-api"
  name          = var.root_name
  function_name = var.root_function_name
  stage_name    = var.root_stage_name
  region        = var.root_region
  accountId = var.root_accountId
}

  