# Terraform settings Block

terraform {
  required_version = ">= 1.9.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }

    time = {
      source  = "hashicorp/time"
      version = "~> 0.11"
    }
  }
}

provider "azurerm" {
  features {}
}

# Generate a random string using a variable length
resource "random_string" "rg_suffix" {
  length  = var.suffix_length
  special = false
  upper   = false
}

# 2. Create the Azure Resource Group using variables and interpolation
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
resource "azurerm_resource_group" "foundry_rg" {
  name     = "vivek-${var.resource_group_middlename}-${random_string.rg_suffix.result}"
  location = var.resource_group_location
}

# 3. Microsoft Foundry Core Resource (Cognitive Services Account)
resource "azurerm_cognitive_account" "foundry_resource" {
  name                = "vivek-foundry-core-env-${random_string.rg_suffix.result}"
  location            = azurerm_resource_group.foundry_rg.location
  resource_group_name = azurerm_resource_group.foundry_rg.name
  kind                = "AIServices" # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cognitive_account#kind-1
  sku_name            = "S0"         # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cognitive_account#sku_name-1

  # CRITICAL: This flag exposes project management capabilities for Foundry
  project_management_enabled = true

  # A unique subdomain is mandatory for custom API routing
  custom_subdomain_name = "vivek-foundry-core-env-subdomain-${random_string.rg_suffix.result}"


  network_acls {
    default_action = "Allow"
  }
  identity {
    type = "SystemAssigned"
  }
}

# 4. GPT-5-Mini Model Deployment linked to the Project
resource "azurerm_cognitive_deployment" "gpt5_mini_deployment" {

  name                 = "gpt-5-mini-deployment"
  cognitive_account_id = azurerm_cognitive_account.foundry_resource.id

  model {
    format  = "OpenAI"
    name    = "gpt-5-mini" # Specific Azure OpenAI model identifier
    version = "2025-08-07" # Replace with your targeted API version string
  }

  sku {
    name     = "GlobalStandard" # Standard or GlobalStandard tier for mini models
    capacity = 100              # Allocated Tokens Per Minute (TPM) in thousands
  }

  rai_policy_name = "Microsoft.Default"
}


# 5. Microsoft Foundry Project
resource "azurerm_cognitive_account_project" "foundry_project" {
  depends_on           = [azurerm_cognitive_deployment.gpt5_mini_deployment]
  name                 = "vivek-foundry-core-env-project-${random_string.rg_suffix.result}"
  cognitive_account_id = azurerm_cognitive_account.foundry_resource.id
  location             = azurerm_resource_group.foundry_rg.location
  description          = "Example cognitive services project"
  display_name         = "Foundry Project Example"

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "test"
  }
}


