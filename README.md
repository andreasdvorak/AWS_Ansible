# AWS Ansible
Setup AWS with Ansible

# AWS Preparations
## AWS user
It is recommended to create a service account.

IAM -> user -> add user

Download the csv file with the credentials.

## AWS Cli
Installation guide

https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

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

# Python Preparation
create a virtual environment

```
pip3 install virtualenv


create a virtual environment
```
virtualenv -p python3 env
```

The result is the folder "env"

activation of virtual environment
```
. env/bin/activate
```

Installation of the requirements
```
python -m pip install -r requirements.txt
```

# Ansible Preparation
Installation of AWS collection, but it should be installed by default.

```
ansible-galaxy collection install azure.azcollection -p collections --force
```

Installation of requirements for the collection
```
pip install -r ./collections/ansible_collections/azure/azcollection/requirements.txt
```

List collections
```
ansible-galaxy collection list
```

# Linter
## Yaml

```
yamllint inventory playbooks roles
```
## Ansible

```
ansible-lint inventory playbooks roles
```