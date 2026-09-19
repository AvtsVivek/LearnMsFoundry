


https://learn.microsoft.com/en-us/azure/foundry/how-to/develop/sdk-overview?pivots=programming-language-csharp#anthropic-sdk


When you try to create the resource zapi_resource.claude_sonnet_4_6_deployment, you may get the following error. 
In such a case, change the subscription. 

This error occurs because your Azure subscription is not linked to a valid, active payment method required for commercial marketplace transactions. E

```txt
╷
│ Error: Failed to create/update resource
│ 
│   with azapi_resource.claude_sonnet_4_6_deployment,
│   on main.tf line 75, in resource "azapi_resource" "claude_sonnet_4_6_deployment":
│   75: resource "azapi_resource" "claude_sonnet_4_6_deployment" {
│ 
│ creating/updating Resource: (ResourceId
│ "/subscriptions/4cdc4288-f428-4519-a144-09592e6e03b9/resourceGroups/vivek-rg-prod-87bbml/providers/Microsoft.CognitiveServices/accounts/vivek-foundry-core-env-87bbml/deployments/claude-sonnet-4-6-deployment"
│ / Api Version "2025-10-01-preview"): PUT
│ https://management.azure.com/subscriptions/4cdc4288-f428-4519-a144-09592e6e03b9/resourceGroups/vivek-rg-prod-87bbml/providers/Microsoft.CognitiveServices/accounts/vivek-foundry-core-env-87bbml/deployments/claude-sonnet-4-6-deployment
│ --------------------------------------------------------------------------------
│ RESPONSE 400: 400 Bad Request
│ ERROR CODE: UserError
│ --------------------------------------------------------------------------------
│ {
│   "error": {
│     "code": "UserError",
│     "message": "Error occurred when subscribing to Marketplace: Marketplace Subscription purchase eligibility check failed, error message [Purchase failed because there is no valid payment method associated with this Azure subscription. Please retry using a subscription that has an active payment instrument. Learn more: https://aka.ms/SaaSPurchaseErrors]."
│   }
│ }
│ --------------------------------------------------------------------------------
│
```

