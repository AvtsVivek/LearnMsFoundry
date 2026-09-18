# variable "resource_group_name" {
#   default     = "vivek-rg-microsoft-foundry-prod"
#   description = "Resource Group name"
# }

variable "resource_group_middlename" {
  type        = string
  description = "The middle part of the resource group name"
  default     = "rg-prod"
}

variable "resource_group_location" {
  default     = "eastus2"
  description = "Location of the resource group."
}

# variable "location" {
#   type        = string
#   description = "The Azure region where the resource group will be created"
#   default     = "East US"
# }

# resource "random_string" "storage_name" {
#   length  = 8
#   special = false
#   upper   = false
# }

variable "suffix_length" {
  type        = number
  description = "The length of the random string suffix"
  default     = 6
}

variable "claude_organization_name" {
  type        = string
  description = "Legal organization name used for Anthropic Claude model-provider attestation."
  default     = "vivek-org-temp"
}

variable "claude_country_code" {
  type        = string
  description = "Two-letter country code used for Anthropic Claude model-provider attestation."
  default     = "US"

  validation {
    condition     = length(var.claude_country_code) == 2
    error_message = "claude_country_code must be a two-letter country code."
  }
}

variable "claude_industry" {
  type        = string
  description = "Lowercase industry value used for Anthropic Claude model-provider attestation."
  default     = "technology"

  validation {
    condition = contains([
      "technology",
      "finance",
      "healthcare",
      "education",
      "retail",
      "manufacturing",
      "government",
      "media",
      "other",
    ], var.claude_industry)
    error_message = "claude_industry must be one of: technology, finance, healthcare, education, retail, manufacturing, government, media, other."
  }
}
