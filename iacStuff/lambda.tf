data "aws_iam_policy_document" "lambda_assume_role_policy"{
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "iam_for_lambda" {  
  name = "iam_for_lambda"  
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json
}


data "archive_file" "python_lambda_package" {  
  type = "zip"  
  source_file = "./lambda_function.py" 
  output_path = "eveLambdaFunction.zip"
}


resource "aws_iam_role" "jam_for_lambda" {
 name = "jam_for_lambda"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Effect = "Allow"
      }
    ]
  })

  inline_policy {
    name = "DynamoDBAccess"
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action = [
            "dynamodb:GetItem",
            "dynamodb:BatchGetItem",
            "dynamodb:Query",
            "dynamodb:PutItem",
            "dynamodb:UpdateItem",
            "dynamodb:DeleteItem",
            "dynamodb:BatchWriteItem"
          ],
          Effect : "Allow"
          Resource : "arn:aws:dynamodb:us-east-1:030768309160:table/eve-visitor-table"
        }
      ]
    })
  }
  managed_policy_arns = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"]
}


resource "aws_lambda_function" "lambda_function" {
        function_name = "eve-lambda"
        filename      = "eveLambdaFunction.zip"
        source_code_hash = data.archive_file.python_lambda_package.output_base64sha256
        role          = aws_iam_role.jam_for_lambda.arn
	      handler       = "lambda_function.lambda_handler"
        runtime       = "python3.9"
}
