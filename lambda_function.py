import boto3
import os
import json

def lambda_handler(event, context):
    visitor_count: int = 0

    # Create the DynamoDB Object
    ddb = boto3.resource('dynamodb')
    table = ddb.Table(os.environ['TABLE_NAME'])

    # create response Object to get table data
    response = table.get_item(Key={"user_id": 1})
    item = response['Item']

    if item:
        visitor_count = item["count"]
    
    # Increment visitor count
    visitor_count += 1
    # Update DB to new count
    table.put_item(Item={"user_id": 1, "count": visitor_count})
    
	# Get item from table after put
    updated_response = table.get_item(
        Key={ 'user_id': 1 }
    )
    updated_item = updated_response['Item']


    return {
        'statusCode': 200,
        'body': json.dumps(int(updated_item['count']))
    }