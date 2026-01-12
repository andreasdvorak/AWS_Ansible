# Role to create an EC2 Instance

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