data "aws_iam_policy_document" "lambda_execution_policy_principals" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

/* data "archive_file" "lambda" {
  type        = "zip"
  source_file = "${path.module}/modules/terraform-module-lambda-api/lambda_zip/lambda_handler.py"
  output_path = "${path.module}/modules/terraform-module-lambda-api/lambda_zip"
} */

resource "aws_lambda_function" "my_lambda_function" {
  filename      = "${path.module}/lambda_zip/lambda_code.zip"
  function_name = var.function_name
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "lambda_handler.lambda_handler"

  source_code_hash = filebase64sha256("${path.module}/lambda_zip/lambda_code.zip")

  runtime = "python3.12"

  environment {
    variables = {
      foo = "bar"
    }
  }
}

resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.my_lambda_function.function_name
  principal     = "apigateway.amazonaws.com"

  # More: http://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-control-access-using-iam-policies-to-invoke-api.html
  source_arn = "arn:aws:execute-api:${var.region}:${var.accountId}:${aws_api_gateway_rest_api.rest_api.id}/*/${aws_api_gateway_method.config_get.http_method}${aws_api_gateway_resource.config.path}"
}

resource "aws_iam_policy_attachment" "lambda_attachment" {
  name       = "lambda_basic_execution"
  roles      = [aws_iam_role.iam_for_lambda.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}