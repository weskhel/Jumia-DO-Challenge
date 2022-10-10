# Instructions

## Before start
First, access AWS and generate an ssh key pair and name it as "jvp" then copy the private key "jvp.pem" to the automation/ansible/keys/ directory with access permission 0400.

After that generate an IAM for Terraform to deploy the infrastructure, these credentials generated in the IAM can be applied to the system in an ephemeral way using the command exemplified below:
- export AWS_ACCESS_KEY_ID="IASJFAKEACCESSKEYROJF"
- export AWS_SECRET_ACCESS_KEY="AOIShfAkEsEcReToasf88o"
- export AWS_DEFAULT_REGION="us-east-1"

## Provisioning the Infrastructure
Inside the automation/terraform/ folder run the commands
- terraform init
- terraform apply

## Configuring the Infrastructure
Before we continue we need to update the /automation/ansible/hosts file with the IP or public DNS data of the EC2 instance created.
Also check the playbook/database.yml file for the RDS address

Now access the automation/ansible/ folder and run the commands in sequence:
- ansible-playbook playbook/ssh-conf.yml -i hosts
- ansible-playbook playbook/firewall.yml -i hosts
- ansible-playbook playbook/docker-inst.yml -i hosts
- ansible-playbook playbook/git-firstDeploy.yml -i hosts
