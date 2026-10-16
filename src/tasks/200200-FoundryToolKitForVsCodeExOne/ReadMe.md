

# Foundry Toolkit for VS Code

1. First install Foundry tool kit.

   ![Installing foundry tool kit](images/50_50_VsCodeExtensionFoundryToolKitVsCode.png)

1. Install Prerequisites. Install wsl, windows subsystem for linux

   ![Validate Prerequisites](images/51_50_ValidatePrerequisites.png)

1. Then install Ubuntu. First check for existing installations.

   ![Existing installations](images/51_60_Wsl_List_Before.png)

1. Install Ubuntu [as mentioned here.](https://learn.microsoft.com/en-us/windows/wsl/install#change-the-default-linux-distribution-installed)

   ```ps
   wsl.exe --install -d Ubuntu
   ```

   ![Installing Ubuntu](images/51_70_Wsl_Installing_Ubuntu.png)

1. Downloading

   ![Downloading](images/51_80_Wsl_Downloading_Ubuntu.png)

1. Installing

   ![asdf](images/51_90_Wsl_Downloading_Ubuntu.png)

1. After installation

   ![asdf](images/51_95_Wsl_Ubuntu_After_Install.png)

1. Once the prerequisites are set up, then start the foundry tool kit interface by clicking the following icon. Then expand Help and Feedback and click Ask Copilot

   ![Foundry tool kit](images/52_50_AzureAIToolKitExInAction.png)

1. Select set up foundry

   ![Ask copilot](images/53_50_WithGitHubCopilot.png)

1. Tell copilot if you have a subscription.

   ![Do you have a subscription](images/54_50_AzureSub.png)

1. Follow the instructions to start creating the project.

   ![Command Palette](images/55_50_CommandPalette.png)

1. From the command palette create project.

   ![Create Project from command palette](images/56_50_CreateProject.png)

1. Select subscription

   ![Select subscription](images/57_50_SelectVsSub.png)

1. Create or choose resource group

   ![Create or choose resource group](images/58_50_CreateOrChooseResourceGroup.png)

1. Give a name to resource group

   ![Give a name](images/59_50_Rg.png)

1. Choose a location

   ![Choose location](images/60_50_ChooseLocation.png)

1. Now create project name

   ![Give project name](images/61_50_EnterProjectName.png)

1. Project creation happening. Look bottom right of VS Code.

   ![Project creation happening](images/62_50_ProjectCreatedSuccessifuly.png)

1. Deploy model. Once the project is deployed successfully, you can see a prompt in botton right to deploy a new model. Click that and model catelog will show up.

   ![Deploy the model](images/63_50_TimeToDeployAModel.png)

1. If the model catelog is closed, you can open the model catelog as follows. Right click the Models under My Resources and select Deploy new AI model

   ![Open model catelog](images/64_50_OpenAIModelCatelog.png)

1. You can use the Command Palette also to open the model catelogue.

   ![Open model catelogue useing the Command Palette](images/65_50_OpenModelCatelogue_FromCommandPalatte.png)

1. Model Catelogue looks as follows. Do ensure VPN is disconnected.

   ![Model Catelogue](images/66_50_ModelCatelogue.png)

1. Filter models, search for some model, and then hover over a model. Then deploy it as follows.

   ![Deploy a model](images/67_50_DeployFromModelCatelogue.png)

## References

1. https://code.visualstudio.com/docs/intelligentapps/overview#_install-and-setup
2. https://code.visualstudio.com/docs/intelligentapps/overview#_verifying-and-installing-foundry-toolkit-pre-requisites-local-models
3. https://learn.microsoft.com/en-us/windows/wsl/install
4. [Your Entire Agentic AI Workflow Now Inside VS Code](https://www.youtube.com/watch?v=aQFSDGAk9DA)
5. The [full playlist](https://www.youtube.com/playlist?list=PLJfWOmd-Usr4)
6. Another [play list](https://www.youtube.com/playlist?list=PLj6YeMhvp2S536NVc7_vp8bBXiIbdr9Ik)


