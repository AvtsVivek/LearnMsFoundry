


https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cognitive_account


# 1. Define required providers
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

# 2. Resource Group
resource "azurerm_resource_group" "foundry_rg" {
  name     = "rg-microsoft-foundry-prod"
  location = "East US"
}

# 3. Microsoft Foundry Core Resource (Cognitive Services Account)
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

# 4. Microsoft Foundry Project
resource "azurerm_cognitive_account_project" "foundry_project" {
  name                 = "my-first-foundry-project"
  cognitive_account_id = azurerm_cognitive_account.foundry_resource.id
}






