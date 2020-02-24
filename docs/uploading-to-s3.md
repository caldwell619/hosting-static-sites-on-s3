# Uploading to S3

After you have developed your code, and are ready to deploy the website, you'll need to follow these steps:

## Bundling the Code

_If you're a **NOT** using a tool such as React or Vue, skip this section_

You need to run the build commands to create a distributable artifact.

Usually, this is `npm run build`. Each tool has it's own output directory, but it's usually `build` or `dist`. Look at your project directory, or the output of the command for the location

## Preparation without using a tool

If you're using normal html, css, and js without any bundling tools, it's totally fine. However, I would recommend putting all of your files that are relevant to the code, inside of a directory named `src/`. Then your `build/` will be `src/`.

Otherwise, you will upload everything to the bucket, like the `.gitignore`, any docs, etc. 

## Uploading to S3

Using the AWS CLI, we are going to upload the contents of the build folder to the bucket. The command is:

```sh
# All caps represent values that will replace them
aws s3 sync \
  PATH_TO_BUILD_FOLDER \
  s3://S3_BUCKET_NAME
```

We are syncing the contents of the build folder with the S3 bucket root.

This will take every file inside of `build/` and put it at the root of the bucket. This is the equivalent of `cp -r BUILD_PATH S3_BUCKET`


