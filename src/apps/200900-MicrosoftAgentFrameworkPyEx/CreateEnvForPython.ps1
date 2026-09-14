
cd ./terraform/

# 1. Fetch all outputs as a PowerShell object
$tfOutputs = terraform output -json | ConvertFrom-Json

# 2. Access your variables using dot notation
# Note: Terraform wraps the actual data inside a '.value' property
$foundryAccountEndpoint = $tfOutputs.foundry_account_endpoint.value
$foundryProjectEndpoints = $tfOutputs.foundry_project_endpoints.value
$foundryProjectApiEndpoint = $tfOutputs.foundry_project_api_endpoint.value
$foundryProjectModelDeploymentName = $tfOutputs.foundry_project_model_deployment_name.value 

# 3. Use the variables in your script
Write-Host "Foundry account endpoint is: $foundryAccountEndpoint"
Write-Host "Foundry project endpoints are: $foundryProjectEndpoints"
Write-Host "Foundry project API endpoint is: $foundryProjectApiEndpoint"
Write-Host "Foundry project model deployment name is: $foundryProjectModelDeploymentName"   


$EnvContent = @" 
AZURE_AI_PROJECT_ENDPOINT=$foundryProjectApiEndpoint 
AZURE_AI_MODEL_DEPLOYMENT_NAME=$foundryProjectModelDeploymentName 
AZURE_AI_AGENT_NAME=vivek-gpt-5-mini-ageint-one 
AZURE_AI_AGENT_INSTRUCTIONS="Provide detailed and accurate responses based on the context of the Foundry project."
"@

Set-Content -Path "..\.env" -Value $EnvContent

cd ..