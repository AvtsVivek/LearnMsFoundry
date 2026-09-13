"""
Create (or update) a Microsoft Foundry prompt agent from an existing model deployment.

This is the SDK equivalent of the Foundry MCP `agent_update` tool: it creates a new
version of a "prompt" agent that references an already-deployed model (for example,
the `gpt-5-mini-deployment` created by the Terraform config in ../terraform/main.tf).

"""


from dotenv import load_dotenv
from azure.identity import DefaultAzureCredential
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import PromptAgentDefinition

load_dotenv()
AZURE_AGENT_NAME = "vivek-gpt-5-mini-agent-one"
# Azure AI Project and Agent Configuration. The following values should be updated with your specific project details.
AZURE_AI_PROJECT_ENDPOINT = "https://vivek-foundry-core-env-subdomain-dawup3.services.ai.azure.com/api/projects/vivek-foundry-core-env-project-dawup3"
AZURE_AI_MODEL_DEPLOYMENT = "gpt-5-mini-deployment"
AZURE_AI_AGENT_INSTRUCTIONS = "You are a helpful assistant."

def main() -> None:
    project_endpoint = AZURE_AI_PROJECT_ENDPOINT
    agent_name = AZURE_AGENT_NAME
    model_deployment = AZURE_AI_MODEL_DEPLOYMENT
    instructions = AZURE_AI_AGENT_INSTRUCTIONS

    print(f"Project Endpoint : {project_endpoint}")
    print(f"Agent Name       : {agent_name}")
    print(f"Model Deployment : {model_deployment}")
    print(f"Instructions     : {instructions}")

    with DefaultAzureCredential() as credential:
        with AIProjectClient(endpoint=project_endpoint, credential=credential) as client:
            agent_version = client.agents.create_version(
                agent_name,
                definition=PromptAgentDefinition(
                    model=model_deployment,
                    instructions=instructions,
                ),
            )

    print("")
    print("Agent version created/updated successfully:")
    print(f"  Agent name : {agent_version.name}")
    print(f"  Version    : {agent_version.version}")
    print(f"  Status     : {agent_version.status}")


if __name__ == "__main__":

    print("Starting create_prompt_agent script...")
    print("")
    print("___________________________________________________________________________________________________")
    print("")

    main()

    print("")
    print("___________________________________________________________________________________________________")
    print("")
    print("Finished running create_prompt_agent script...")
