

# Outputs for the Microsoft Foundry Project endpoints

output "foundry_account_endpoint" {
  description = "The endpoint of the Microsoft Foundry (Cognitive Services) account."
  value       = azurerm_cognitive_account.foundry_resource.endpoint
}

output "foundry_project_endpoints" {
  description = "A map of endpoint names to endpoint URLs for the Microsoft Foundry project."
  value       = azurerm_cognitive_account_project.foundry_project.endpoints
}

output "foundry_project_api_endpoint" {
  description = "The Foundry project API endpoint, in the form https://<account>.services.ai.azure.com/api/projects/<project>."
  value       = azurerm_cognitive_account_project.foundry_project.endpoints["AI Foundry API"]
}

output "foundry_project_model_deployment_name" {
  description = "The name of the model deployment backing the Foundry project."
  value       = azapi_resource.claude_sonnet_4_6_deployment.name
}

output "azure_openai_v1_endpoint" {
  description = "Deprecated compatibility output. Use claude_anthropic_messages_endpoint for Claude requests."
  value       = "https://${azurerm_cognitive_account.foundry_resource.custom_subdomain_name}.services.ai.azure.com/anthropic/v1/messages"
}

output "claude_anthropic_base_endpoint" {
  description = "The Anthropic API base endpoint for Claude models in Microsoft Foundry."
  value       = "https://${azurerm_cognitive_account.foundry_resource.custom_subdomain_name}.services.ai.azure.com/anthropic"
}

output "claude_anthropic_messages_endpoint" {
  description = "The Anthropic Messages API endpoint for Claude models in Microsoft Foundry."
  value       = "https://${azurerm_cognitive_account.foundry_resource.custom_subdomain_name}.services.ai.azure.com/anthropic/v1/messages"
}