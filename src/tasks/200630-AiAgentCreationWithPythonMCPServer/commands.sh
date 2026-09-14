
cd ../..

cd ../../..

# cd into the directory.

cd src/tasks/200630-AiAgentCreationWithPythonMCPServer

cd src/apps/200630-AiAgentCreationWithPythonMCPServer/terraform

dir

# Terraform follows, the following workflow.

# Init, Plan, Validate, Apply, and then Destroy

terraform init

terraform fmt # formats the tf files.

terraform validate

# Clear off the previous state, if any.
terraform plan -destroy -out main.destroy.tfplan

terraform show main.destroy.tfplan

terraform apply main.destroy.tfplan

terraform plan -out main.tfplan

terraform show main.tfplan

terraform apply main.tfplan

terraform state list

terraform show terraform.tfstate

# For the following command to work, you need to pass on the resource, or data source.
# This resource or data source is got from terraform state list command
terraform state show azurerm_resource_group.foundry_rg

terraform state show random_string.rg_suffix

terraform state show azurerm_cognitive_account.foundry_resource

terraform state show azurerm_cognitive_account_project.foundry_project

terraform show terraform.tfstate

cd ..

python --version

Remove-Item -Path "myenv" -Recurse -Force

python -m venv "myenv"

myenv\Scripts\activate

pip install python-dotenv

pip show python-dotenv

pip install azure-ai-projects azure-identity

pip show azure-ai-projects

pip show azure-identity

pip install azure-ai-projects>=2.1.0

pip show azure-ai-projects

dir

python --version

# Run the script to copy the endpoints to the clipboard.
pwsh ./EndpointCopyToClipboard.ps1

# Open the file and paste the copied endpoints where necessary.
python ./create_prompt_agent.py

cd ./terraform

terraform plan -destroy -out main.destroy.tfplan

terraform show main.destroy.tfplan

terraform apply main.destroy.tfplan

Remove-Item -Path "../myenv" -Recurse -Force
