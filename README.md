# Deploying a Static Website to S3

At the end of this, you will be able to host your static (html, css, js) websites on AWS S3, allowing others to see your work

<a href="https://docs.google.com/presentation/d/1NQ45ex4ZJLJVNc4f_Uf1n93-j-jiRyyGd-57YMIwwVE/edit?usp=sharing" target="_blank" rel="noopener">Here are the slides</a> that accompany this repository.

## Who is this for?

This guide's target audience has little to no familiarity with AWS, or it's services. 

## Prerequisites

Follow [this guide](./docs/prerequisites.md), then come back.

## The AWS CLI

Follow [these steps](./docs/aws-cli.md) to properly install the AWS Command Line Interface.

## Setting up the S3 Bucket

Follow [these steps](./docs/setting-up-s3.md) to set up your bucket.

## Uploading

Follow [these steps](./docs/uploading-to-s3.md) to deploy to S3.

## Using the scripts

To run the included scripts, use `sh FILE_NAME` which will run them as bash scripts. It's similar to using `node FILE_NAME`. If you're interested in where it actually gets the file, its in your `/usr/bin/` on Mac / Linux systems. They are binaries that map to a specific program you have installed.

Anyway, for the static:

```shell
sh scripts/deploy-static.sh
```

and for the React project

```shell
sh scripts/deploy-react.sh
```