import boto3

def lambda_handler(event, context):
    user = event["user_id"]
    visitor_count: int = 0

    # Create the DynamoDB Object
    ddb = boto3.resource('dynamodb')
    table = ddb.Table('EverlyVisitorCounter')

    # create response Object to get table data
    response = table.get_item(Key={"user_id": user})
    item = response['Item']

    if item:
        visitor_count = item["count"]
    
    # Increment visitor count
    visitor_count += 1
    # Update DB to new count
    table.put_item(Item={"user_id": user, "count": visitor_count})


    message = f"Hello {user}, You have visited my page {visitor_count} times!"
    return {
        "message": message
    }


if __name__ == "__main__":
    event = {"user_id": 1}
    print(lambda_handler(event, None))