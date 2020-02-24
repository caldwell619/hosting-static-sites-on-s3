#!/bin/sh

# in bash, environment variables are refferred to with a "$" before them

npm run build

# If the above command was NOT successful
if [ $? != 0 ]
then
  # Exit with a non 0 status code, meaning this specific script failed
  exit 1
fi # "fi" closes the if condition above

# using the aws cli, go into the s3 utility, call the command "sync"
aws s3 sync \
  # Which directory is going to be synced with the bucket
  ./build/ \
  # Which bucket the directory will be synced with
  s3://$S3_BUCKET

# The above is the same as this:

# aws s3 sync .build/ s3://$S3_BUCKET