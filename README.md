# AWS Ansible
Setup AWS with Ansible

# Python Preparation
create a virtual environment

```
pip3 install virtualenv
```

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

Installation of Ansible collections
```
ansible-galaxy collection install -r requirements.yml --collections-path ./collections
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

# Ansible execution
Check variables of localhost
```
ansible-inventory --host localhost
```

Check variables of testvm1
```
ansible-inventory --list
```

Run
```
ansible-playbook ./playbooks/aws.yml [--check] [--diff]
```

# Default login user
The default login user depends on the used AMI OS.

| OS | User |
|----------|----------|
| Amazon Linux  | ec2-user  |
| Ubuntu  | ubuntu  |
| Debian  | admin or debian |
| CentOS  | centos |
| RHEL    | ec2-user |