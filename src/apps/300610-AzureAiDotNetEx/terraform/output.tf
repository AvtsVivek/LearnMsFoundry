

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
  value       = azurerm_cognitive_deployment.gpt5_mini_deployment.name
}