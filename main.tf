resource "aws_dynamodb_table" "basic-dynamodb-table" {
    name            = "eve-visitor-table"
    billing_mode    = "PAY_PER_REQUEST"
    hash_key        = "user_id"

    attribute {
        name = "user_id"
        type = "N"
    }

    tags = {
        Name        = "iac-ddb-table-tst01"
        Environment = "Dev"
    }
}