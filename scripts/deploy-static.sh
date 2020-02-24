#!/bin/sh

# Bring the variables from the `.env` file into this script's environment
source .env

# in bash, environment variables are refferred to with a "$" before them

# using the aws cli, go into the s3 utility, call the command "sync"
# Which directory is going to be synced with the bucket
# Which bucket the directory will be synced with
aws s3 sync \
  ./static-src/ \
  s3://$S3_BUCKET 

# The above is the same as this:

# aws s3 sync .build/ s3://$S3_BUCKET