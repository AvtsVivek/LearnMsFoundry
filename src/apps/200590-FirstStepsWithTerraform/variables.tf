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
  default     = "southindia"
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
