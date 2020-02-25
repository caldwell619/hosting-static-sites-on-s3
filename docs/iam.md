# Creating an IAM User in AWS

_*Disclaimer_ Knowing this isn't super important **right now**. You can use [the shortcut](#finally) and still deploy websites.

Lots of tutorials explain this better than I ever could, but here's the TL;DR.

Everything, and I do mean everything, in AWS needs permission to run. 

Want to update data inside a database when you're a QA Tester? NO.

Want to delete a database when you're a developer? NO.

## Policies

Every single action in AWS is governed by a policy. Here is an example complete policy, then we will break it down.

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Gives read access to static content",
      "Effect": "Allow",
      "Principal": {
          "AWS": "*"
      },
      "Action": "s3:GetObject",
      "Resource": [
          "arn:aws:s3:::YOUR_BUCKET_NAME/*",
          "arn:aws:s3:::YOUR_BUCKET_NAME"
      ]
    }
  ]
}
```

### Effect

This can be either "Allow" or "Deny". Pretty straightforward.

### Structure

> SERVICE:ACTION

Example:

> s3:getObject

This targets the service called S3, and the action of getting an object from it.

### Resource

This is the specific resource within the service. You're targeting S3, but which bucket? You're targeting a database, but which one?

AWS identifies resources with an Amazon Resource Name (ARN). Heres an example:

> arn:aws:dynamodb:us-west-2:123456789012

This isn't important right now, just food for thought.

An array would denote that this specific action is applied to multiple resources.

We are going to use a policy that looks something like this: 

Allow any action, on any service, on any resource.

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Admin",
      "Effect": "Allow",
      "Action": "*:*",
      "Resource": "*"
    }
  ]
}
```

## Users

Users are just that. Users. They're given permissions through various means to execute applicable things on an AWS account

Everyone has a user profile, that has policies attached to it through various means.

Users also have access keys, which we will talk about later, that identify them.

## Groups

Groups function to group users together. Wow. Did that really need an explanation?

These groups can be `developers`, `QA`, `admin`, etc.

## Finally

Okay, so here's what we do.

### Create Admin Group

Create a group, named "admin", and attach the pre made policy for admin access. It allows all actions on all resources.

<img src="../videos/group-iam.gif" width="70%"></img>

### Create Admin User

Create a user, named whatever you want. 

Assign this user to the group you just created for admins.

Some things to note:

1. Enable "Programmatic access" and "AWS Management Console access"
2. Leave the settings the way the are ( or you can do a custom password and uncheck having to reset it )
3. Ignore tags
4. Download the `.csv` that comes when you create the user. You **CANNOT** access this again without starting over. 
5. Copy the password, as you'll need it to sign in ( if you did auto-generated )

<img src="../videos/user-iam.gif" width="70%"></img>

## Summary

Checklist:

:white_check_mark: Admin group

:white_check_mark: User created and assigned to the admin group

:white_check_mark: Ability to log into the AWS console

:white_check_mark: A `.csv` file storing the appropriate keys

Time to [move on](./aws-cli.md)