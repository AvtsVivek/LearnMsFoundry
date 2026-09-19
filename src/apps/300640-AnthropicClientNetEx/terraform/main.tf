# Terraform settings Block

terraform {
  required_version = ">= 1.9.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.55"
    }

    azapi = {
      source  = "azure/azapi"
      version = ">= 2.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
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

provider "azapi" {}

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

# 4. Claude Sonnet 4.6 Model Deployment linked to the Project
# NOTE: claude-sonnet-5 had 0 TPM quota available in this subscription/region
# at the time of writing; claude-sonnet-4-6 is the closest available model
# with quota. Switch back to claude-sonnet-5 once quota is granted.
resource "azapi_resource" "claude_sonnet_4_6_deployment" {
  type                      = "Microsoft.CognitiveServices/accounts/deployments@2025-10-01-preview"
  name                      = "claude-sonnet-4-6-deployment"
  parent_id                 = azurerm_cognitive_account.foundry_resource.id
  schema_validation_enabled = false

  body = {
    sku = {
      name     = "GlobalStandard"
      capacity = 25
    }

    properties = {
      model = {
        format  = "Anthropic"
        name    = "claude-sonnet-4-6"
        version = "1"
      }

      modelProviderData = {
        organizationName = var.claude_organization_name
        countryCode      = var.claude_country_code
        industry         = var.claude_industry
      }

      versionUpgradeOption = "OnceNewDefaultVersionAvailable"
      raiPolicyName        = "Microsoft.DefaultV2"
    }
  }
}

# 5. Sequential Delay Mechanism
resource "time_sleep" "wait_for_prior_task_completions" {
  # Ensures the timer stays alive until the project is completely gone
  depends_on       = [azapi_resource.claude_sonnet_4_6_deployment]
  destroy_duration = "10s"
  create_duration  = "10s" # Adjust to "30s" or "90s" if needed
}

# 6. Microsoft Foundry Project
resource "azurerm_cognitive_account_project" "foundry_project" {
  depends_on = [
    # time_sleep.wait_for_prior_task_completions, 
    azapi_resource.claude_sonnet_4_6_deployment
  ]
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

