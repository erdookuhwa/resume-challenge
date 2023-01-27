# Partaking in Forrest Brazeal's [Cloud Resume Challenge](https://cloudresumechallenge.dev/docs/the-challenge/aws/)

#### I will be detailing my progress in the Challenge here

#### 1. Certification
* _AWS Cloud Practioner ->_

<a href="https://www.credly.com/badges/a4294a44-a48c-417a-b9b4-057f0db2007a/linked_in_profile" target="_blank">
  <img src="https://user-images.githubusercontent.com/64602124/213741769-f78cc2d6-a804-4efe-b323-499bcd24d1c0.png" width="100" height="100" />
</a>

* _AWS Solutions Associate ->_
<a href="https://www.credly.com/badges/eede24b9-0951-4976-b84f-bdf2734368cd/linked_in_profile" target="_blank">
  <img src="https://user-images.githubusercontent.com/64602124/213743163-5b13685b-f4ca-468b-84da-f5c0963e6e07.png" width="100" height="100" />
</a>

* _AWS Cloud Quest: Cloud Practitioner ->_
<a href="https://www.credly.com/badges/08ab8a1f-c64a-4a26-a878-b080048e80b1" target="_blank">
  <img src="https://user-images.githubusercontent.com/64602124/213744116-9b5336ae-e5d4-42c4-89a2-ed981796fcbb.png" width="100" height="100" />
</a>

#### 2. HTML and 3. CSS ->
* HTML and CSS files for the resume are available in this repo.

#### 4. Static Website
* My resume files are hosted in an S3 bucket

#### 5. HTTPS
* Issued a certificate for my domain to handle HTTPS with _CloudFront_ and origin from the S3 bucket

#### 6. DNS
* Using Route53's hosted zone, configured Routing via CloudFront. My resume can be found at [resume.everlycloud.tk](https://resume.everlycloud.tk/)

#### 7. JavaScript
* Written a small script to fetch and update count via my API Gateway. Embedded within my html file. _Visitor Count_ can now be viewed on my resume page.

#### 8. Database
* Using Amazon's (Serverless) DynamoDB to retrieve and update visitor count

#### 9. API
* Within my lambda function, I've added an API Gateway which accepts requests (when there's a visit to my resume) and updates my database with the count.

#### 10. Python
* My lambda function (written in Python) handles the backend and uses boto3 which is an AWS SDK for Python

