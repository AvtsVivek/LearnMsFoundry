
# Exploring Models in Foundry Toolkit

## Ask Copilot for model recommendations

The Copilot says:

I don't have a direct command-execution tool available in this session to launch the Model Catalog UI for you automatically, but here's how you can open it yourself:

1. Open the Command Palette in VS Code (`Ctrl+Shift+P`).

2. Run Foundry Toolkit / AI Toolkit: Models (this maps to command `ai-mlstudio.models`).

3. In the catalog, filter by provider "Microsoft Foundry", then search for `gpt-4o` and `gpt-4o-mini` to compare their vision capabilities, benchmarks, and pricing side by side.

In Visual Studio Code GitHub Copilot Chat, enter the following prompt:

> Recommend two models I should compare for a marketing scenario, with image input support, available in Foundry Toolkit, and deployable in my Azure subscription (Visual Studio Professional Subscription) and my Azure region (South India).

![PromptForModels](images/50_50_PromptForModels.png)

Here is more information about the same:

![PromptForModels](images/51_50_PromptForModelsTow.png)

And here is the response:

![Prompt with respojse](images/51_60_PromptForModelsWithResponse.png)

## Open and filter the model catalog

You can open the model catalog using the following command in the Command Palette:

![Open Model Catelogue](images/52_50_OpenModelCatalogFromVsCodePalette.png)

If something appears disabled, or models are not showing properly, the VPN may be preventing proper connections. Try disconnecting from the VPN.

![FilterModelFoundryDisabled](images/52_60_FilterModelFoundryDisabled.png)

Disconnecting from the VPN may show all available models. Filter them by choosing Foundry in the **Hosted by** filter and selecting a publisher, such as OpenAI.

![FilterModel](images/53_50_FilterModel.png)

After filtering, select a model and open the menu using the arrow next to the **Deploy** button. You can choose **Deploy with default settings** or **Custom deploy**.

![FilterModelDeploy](images/55_50_FilterModelDeploy.png)

Once deployed, you can view the model in the Azure portal.

![Azure portal](images/56_50_AiAzurePortal.png)

With **Custom deploy**, you can change parameters as follows:

![Custom Deploy](images/56_50_CustomDeploy.png)

You can deploy multiple models and view them in the model list:

![Models](images/57_50_Models.png)

To see a deployed model's details, click the three dots at the far right of its row and select **Edit**.

![Model details Edit from Model view](images/57_60_EditDeployedModel.png)

The model details are displayed as follows:

![Model Details](images/57_70_ViewModelDetails.png)

## Compare models in the playground

In the model list, click a model to open it in the playground. From there, you can compare models.

![Open Model in Playground](images/58_50_OpenModelInPlayGround.png)

In compare mode, you can ask multiple models the same question. For example, enter:

> Create a short LinkedIn post about developer productivity with AI tools.

![Playground Prompt](images/59_50_OpenModelInPlayGroundCompareWitPrompt.png)

Responses vary by model:

![Promt Response](images/60_50_OpenModelInPlayGroundCompareWitPromptResponse.png)

Here is an example with a different set of models:

![Prompt Response 2](images/61_50_OpenModelInPlayGroundCompareWitPromptResponse2.png)

The following is a sample image you can use in a prompt:

![Sample Image](images/62_50_SampleImage.png)

![Prompt Response](images/63_50_OpenModelInPlayGroundCompareWitPromptResponse3.png)

You can attach an image to a prompt as follows:

![Prompt Response](images/64_50_OpenModelInPlayGroundCompareWitPromptResponse3.png)

## Use the playground with one model

You can also use the playground with a single model. For example, use this prompt:

> You are an intelligent and friendly AI assistant that supports a social media management team creating content targeted to a developer audience, on different channels and formats.

> Your role is to:
> - Engage with users in natural conversation to understand their social media content creation goals.

![Social Medial Team](images/65_50_SocialMedialTeam.png)

Here is another screenshot:

![Social media example](images/65_50_SocialMedialTeam2.png)
