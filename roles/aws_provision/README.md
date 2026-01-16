# Role AWS provision
This role is used for the administration of AWS.

It can create
* EC2 instances
* elastic ip

# Add EC2 instance
Add the name of the new ec2_instance to the inventory group

[aws]

Run ansible
```
ansible-playbook ./playbooks/aws.yml --diff
```

After the creation of the instance, add the host and the public ip to the inventory.

Maybe you need to add the host to serveral groups.

# Remove EC2 instance
Add this line to the host specific yaml file

aws_ec2_state: absent

# ssh
ssh -i <privat_key>.pem <osspecificuser>@<public_ip> -o IdentitiesOnly=yes

# Parameter
Change the parameter in the file defaults/main.yml or overwrite that in group_vars oder hosts_vars.

# Parameter ec2

| Variable      | Explaination  |
| ------------- | ------------- |
| aws_provision_assign_elastic_ip | "present|absent" |
| aws_provision_tag_role | Tag for role |
| aws_provision_os | Operating system of EC2 instance possible values amazon_linux, ubuntu, redhat, debian |
| aws_cli_zip_destination | Destination directory and file name of the download |

# Parameter S3


aws_provision_s3_buckets:
  - name: <unique name in aws>
    acl: "private"
    delete_public_access: "true"
    state: present
    tags:
      owner: ich
      example: tag1
    versioning: "true"
    lifecycle_days: 10

If you get this error, the name is already in use:

ERROR]: Task failed: Module failed: Failed to determine if bucket exisits (permission denied): An error occurred (403) when calling the HeadBucket operation: Forbidden
