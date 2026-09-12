
cd ../..

cd ../../..

# cd into the directory.

cd src/tasks/200650-AzureAiPythonEx

cd src/apps/200650-AzureAiPythonEx/terraform

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

python -m venv myenv

.\myenv\Scripts\activate

pip install azure-ai-projects azure-identity

pip show azure-ai-projects

pip show azure-identity

cd ./src/apps/200650-AzureAiPythonEx/myenv/

dir

python --version

pip install azure-ai-projects>=2.1.0

python ./my_first_agent.py

python ./my_first_agent_asking-to_tell_a_joke.py

terraform plan -destroy -out main.destroy.tfplan

terraform show main.destroy.tfplan

terraform apply main.destroy.tfplan

