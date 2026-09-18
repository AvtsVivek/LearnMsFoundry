
# 1. Fetch all outputs as a PowerShell object
$tfOutputs = terraform output -json | ConvertFrom-Json

# 2. Access your variables using dot notation
# Note: Terraform wraps the actual data inside a '.value' property
$foundryAccountEndpoint = $tfOutputs.foundry_account_endpoint.value
$foundryProjectEndpoints = $tfOutputs.foundry_project_endpoints.value
$foundryProjectApiEndpoint = $tfOutputs.foundry_project_api_endpoint.value
$foundryProjectModelDeploymentName = $tfOutputs.foundry_project_model_deployment_name.value 
$claudeAnthropicMessagesEndpoint = $tfOutputs.claude_anthropic_messages_endpoint.value

# 3. Use the variables in your script
Write-Host "Foundry account endpoint is: $foundryAccountEndpoint"
Write-Host "Foundry project endpoints are: $foundryProjectEndpoints"
Write-Host "Foundry project API endpoint is: $foundryProjectApiEndpoint"
Write-Host "Foundry project model deployment name is: $foundryProjectModelDeploymentName"   
Write-Host "Claude Anthropic Messages API endpoint is: $claudeAnthropicMessagesEndpoint"

# 4. Copy the Anthropic Messages API endpoint to the clipboard
$claudeAnthropicMessagesEndpoint | Set-Clipboard

Write-Host "The following Claude Anthropic Messages API endpoint has been copied to the clipboard:"
Write-Host "$claudeAnthropicMessagesEndpoint"
