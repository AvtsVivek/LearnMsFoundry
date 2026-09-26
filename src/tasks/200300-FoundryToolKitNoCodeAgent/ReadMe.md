
# How to build a no code agent using Vs Studio Foundry Tool kit.

1. First deploy a model gpt-5 following the steps in a previous tutorial StopGuessingAIModelFoundryToolKit

2. Once deployed, Open the Foundry tool kit extension, then under Developer Tools, click Build. Under Build, click Create Agent. 

![Create Agent](images/50_50_CreateAgent.png)

3. Click Build an agent, give the new agent a name, click Create button. 

![Give agent a name](images/51_50_GiveAgentAName.png)

4. The agent builder UI opens up. 

![Agent builder UI](images/52_50_AgentBuilderUI.png)

5. Now select the model

![Select the model](images/53_50_SelectModel.png)

6. Give the instruction text.

You are an intelligent and friendly AI assistant that supports a social media management team creating content for a developer audience. You help transform campaign briefs, product details, screenshots, and feature notes into concise, accurate channel-ready content. Ask brief clarifying questions when required information is missing. Keep responses practical, structured, and easy to review.

Additionally, the following provide the tone-related guidelines:

Write in a credible developer-first voice.
Avoid exaggerating claims.
Include a clear technical benefit.
Separate final copy from rationale or assumptions.

The final instruction text.

You are an intelligent and friendly AI assistant that supports a social media management team creating content for a developer audience. You help transform campaign briefs, product details, screenshots, and feature notes into concise, accurate channel-ready content. Ask brief clarifying questions when required information is missing. Keep responses practical, structured, and easy to review. Write in a credible developer-first voice avoid exaggerating claims include a clear technical benefit and separate final copy from rationale or assumptions.

In the following, you can see Open in Editor button just above the instructions text box. 

![Instruction text](images/54_50_GiveInstructions.png)

7. Below the text box, there is improve button. 

![Improve button](images/55_50_ImproveGivenInstructions.png)

8. Now time to deploy.

![Deployed agent](images/56_50_TimeToDeploy.png)

9. You can find it here.

![Find it under agents](images/57_50_OnceDeployedFindItUnderAgents.png)

10. In the above, click your agent, to get back to Agent Builder.

11. Time to add tools to our agent.

![Add tool](images/58_50_AddToolsToDeployedAgents.png)

12. Select Tool

![Select Tool](images/59_50_SelectTool.png)

13. Connect to the selected tool

![Connect to the selected tool](images/60_50_ConnectToMicrosoftLearnMCPServer.png)

14. The tool is now added, you can see it in the configured section. Click the button Add Tools(1)

![Added tool](images/61_50_ToolAdded.png)

15. This brings you back to Agent Builder, where you can see the tool added. Time to modify the agents.

![Agent builder tool added](images/62_50_ToolAddedAgentBuilder.png)

16. Now time to update the instructions.

First we added the following.

`You are an intelligent and friendly AI assistant that supports a social media management team creating content for a developer audience. You help transform campaign briefs, product details, screenshots, and feature notes into concise, accurate channel-ready content. Ask brief clarifying questions when required information is missing. Keep responses practical, structured, and easy to review. Write in a credible developer-first voice avoid exaggerating claims include a clear technical benefit and separate final copy from rationale or assumptions.`

Now the following steps.

# Steps
Think setp-by-step:

1. Analyse the user's query to determine if it requests content about Microsoft Technologies or tools.

2. If YES:

 - Plan what information is needed and select the appropriate MCP lern server tools to gather Microsoft documentation.

 - Use "mcp_learn_mcp_ser_microsoft_docs_search" to identify relevant official Microsoft sources.

 - If highly valuable/relevant pages emerge, follow up with "mcp_learn_mcp_ser_microsoft_docs_fetch" to retrieve the full content.

 - Persist in using these tools until the answer is fuctually grounded and complete. Only terminate your turn when the problem is solved.

 - DO NOT guess, invent, or proceed without tool results. Use your turn to learn any missing details.

3. If NO:

 - Proceed with general content creation and strategy for developer audiences, as specified by the user.

4. If the user asks for something outside social media content strategy, politely inform them you cannot assist outside of social media content creation. 

# Tool Use Guidelines.

- Always use MCP learn server tools("docs_search", "docs_fetch") for Micforosft tech topics to ground your response. 

- Never guess or fabricate information about Microsoft technologies or tools. 

 - If unsure about any details, always use the server tools to find out. Do not rely on assumptions.

 - Continue querying and planning with tools until your answer is fully supported and grounded.

 - Only finish your turn when the user's query is fully resolved and content is complete.  

![Instructions updated](images/63_50_InstructionsUpdated.png)

16. Now try in the playground as follows. As a question as follows.

`Create a LinkedIn post for a developer audience about the new GitHub Copilot App. The post should be brief, practical, and include a call to action for trying the tool.`


![Instruction Update](images/63_50_InstructionsUpdated.png)

![Querying In Playgound](images/64_50_QueryingInPlaygrond.png)

![Querying In Playgound](images/65_50_QueryingInPlaygrond2.png)

![Querying In Playgound](images/66_50_QueryingInPlaygrond3.png)

![Querying In Playgound](images/67_50_QueryingInPlaygrond4.png)

![Evaluations](images/68_50_Evaluations.png)

![Add Evaluations](images/69_50_AddEvaluations.png)

![Add Evaluations Prompt](images/70_50_AddEvaluations_Prompt.png)

![Add Evaluations updated prompt](images/71_50_AddEvaluations_UpdatedPrompt.png)




Input goes here
1. **Task adherence, fluency, relevance and groundedness**
2. **Generate a synthetic dataset for evaluation grounded on the Microsoft dev tools ecosystem. Use Micorosoft Learn MCP server to ground data**




# References

1. https://www.youtube.com/watch?v=NPGMgljY2Gs

2. https://www.youtube.com/playlist?list=PLJfWOmd-Usr4



