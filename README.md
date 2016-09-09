# Photos
Rails application for uploading and viewing photos


## Setting up access to S3

### Environment variables
The following commands should be run for each dev/staging/prod env. Note that the S3 credentials should never be stored in a file or committed to source control.


    heroku config:set AWS_ACCESS_KEY_ID=xxx AWS_SECRET_ACCESS_KEY=yyy --remote <env>

    heroku config:set S3_BUCKET_NAME=name-of-bucket --remote <env>

### CORS configuration
To upload to S3, we need to enable CORS on the relevant buckets. Through the AWS console, change the configuration to look like the following for dev:

    <?xml version="1.0" encoding="UTF-8"?>
    <CORSConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
      <CORSRule>
        <AllowedOrigin>http://localhost:3000</AllowedOrigin>
        <AllowedMethod>GET</AllowedMethod>
        <AllowedMethod>POST</AllowedMethod>
        <AllowedMethod>PUT</AllowedMethod>
        <AllowedHeader>*</AllowedHeader>
      </CORSRule>
    </CORSConfiguration>

The bucket for staging/prod should be set up similarly, but with the appropriate `AllowedOrigin`.