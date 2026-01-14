# Role aws cli
This role is used for the installation of the AWS cli.

# AWS user
It is recommended to create a service account.

IAM -> user -> add user

Download the csv file with the credentials.

# AWS Cli credentials
For the configuration you need you credential details
```
aws configure
```

File are created here

~/.aws

Test the connection
```
aws iam list-users
```

# Parameter

| Variable      | Explaination  |
| ------------- | ------------- |
| aws_cli_extract_dir | Directory where the zip file is extract |
| aws_cli_install_cmd | Directory and file for the installation |
| aws_cli_url | URL of the file |
| aws_cli_zip_destination | Destination directory and file name of the download |
