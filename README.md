# LearnMsFoundry
A repo to learn Microsoft Foundry

The gitignore is got from [here](https://github.com/microsoft/Foundry-Local/blob/main/.gitignore)



# References
1. https://www.youtube.com/shorts/-9SzGRbaS_E
2. https://learn.microsoft.com/en-us/azure/foundry/what-is-foundry?tabs=csharp
3. https://learn.microsoft.com/en-us/azure/foundry-local/what-is-foundry-local
4. https://github.com/microsoft/agent-framework/tree/main/dotnet
5. https://learn.microsoft.com/en-us/agent-framework/overview
6. https://github.com/microsoft/agent-framework/tree/main/dotnet
7. https://learn.microsoft.com/en-us/agent-framework/get-started/your-first-agent
8. https://zerotomastery.io/courses/azure-ai-bootcamp/



# Foundry Local
1. https://www.foundrylocal.ai/
2. https://learn.microsoft.com/en-us/azure/foundry-local/what-is-foundry-local
3. https://github.com/microsoft/Foundry-Local/tree/main/samples
4. https://www.foundrylocal.ai/models

# Foundry Toolkit
1. https://www.youtube.com/playlist?list=PLJfWOmd-Usr4
2. https://code.visualstudio.com/docs/intelligentapps/overview#_verifying-and-installing-foundry-toolkit-pre-requisites-local-models
3. https://www.youtube.com/watch?v=IioWS8yhjJc

# 1. Define required providers

```hcl
terraform {
  required_version = ">= 1.9.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}
```

# 2. Resource Group
```hcl
resource "azurerm_resource_group" "foundry_rg" {
  name     = "rg-microsoft-foundry-prod"
  location = "East US"
}
```

# 3. Microsoft Foundry Core Resource (Cognitive Services Account)
```hcl
resource "azurerm_cognitive_account" "foundry_resource" {
  name                = "foundry-core-env"
  location            = azurerm_resource_group.foundry_rg.location
  resource_group_name = azurerm_resource_group.foundry_rg.name
  kind                = "AIServices"
  sku_name            = "S0"

  # CRITICAL: This flag exposes project management capabilities for Foundry
  allow_project_management = true

  # A unique subdomain is mandatory for custom API routing
  custom_subdomain_name = "foundry-core-env-subdomain"
}
```

# 4. Microsoft Foundry Project
```hcl
resource "azurerm_cognitive_account_project" "foundry_project" {
  name                 = "my-first-foundry-project"
  cognitive_account_id = azurerm_cognitive_account.foundry_resource.id
}
```

Google Search the following 
how to create an azure resource of type foundry using cli

## Use the following to remove unwanted files using powershell.


```powershell
Get-ChildItem -Path . -Recurse -File -Include "main.destroy.tfplan", "main.tfplan", "terraform.tfstate", "terraform.tfstate.backup" | Remove-Item -Force
```