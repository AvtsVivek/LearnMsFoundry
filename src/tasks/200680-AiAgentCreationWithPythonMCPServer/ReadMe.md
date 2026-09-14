
# 1. Using MCP server to create agent 

In the previous example, the model is saved as an agent by clicking a button and then giveing it a name. 

But there is another way to create this agent. This involves calling Foundry MCP Server. The Foundry MCP server exposes an upsert-style tool, agent_update, which both creates and updates prompt agents

create_prompt_agent.py

Run the above pyton script and the agent will be created. 

But before running it, the script needs to be updated with the correct end point. So open that script and update it.

There is a helper power shell script which will copy the end point to the clip board.

EndpointCopyToClipboard.ps1


