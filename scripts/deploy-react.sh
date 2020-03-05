#!/bin/sh
node_modules_path="react-demo/node_modules"

# Bring the variables from the `.env` file into this script's environment
source .env

# in bash, variables are refferred to with a "$" before them
# Checking if node_modules for React have been installed
if [ -d $node_modules_path ] 
then
  echo "yes"
else
  npm i --prefix react-demo/
  echo "no"
fi


npm run build --prefix react-demo/

# If the above command was NOT successful
if [ $? != 0 ]
then
  # Exit with a non 0 status code, meaning this specific script failed
  exit 1
fi # "fi" closes the if condition above

# using the aws cli, go into the s3 utility, call the command "sync"
  # Which directory is going to be synced with the bucket
  # Which bucket the directory will be synced with
aws s3 sync \
  ./react-demo/build/ \
  s3://$S3_BUCKET

# The above is the same as this:

# aws s3 sync .build/ s3://$S3_BUCKET