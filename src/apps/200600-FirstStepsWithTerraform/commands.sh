
cd ..\..\..

cd src\apps\200600-FirstStepsWithTerraform

terraform fmt

terraform init

code . -r

terraform validate

terraform plan -out main.tfplan

terraform show main.tfplan

terraform apply main.tfplan

terraform apply -var="resource_group_middlename=rg-staging" -var="suffix_length=8"

terraform state list

# For the following command to work, you need to pass on the resource, or data source.
# This resource or data source is got from terraform state list command
terraform state show azurerm_resource_group.foundry_rg

terraform state show random_string.rg_suffix

terraform state show azurerm_cognitive_account.foundry_resource

terraform state show azurerm_cognitive_account_project.foundry_project

terraform show terraform.tfstate

terraform plan -destroy -out main.destroy.tfplan

terraform show main.destroy.tfplan

terraform apply main.destroy.tfplan


