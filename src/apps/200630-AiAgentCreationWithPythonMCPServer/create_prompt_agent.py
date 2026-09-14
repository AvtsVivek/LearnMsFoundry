"""
Create (or update) a Microsoft Foundry prompt agent from an existing model deployment.

This is the SDK equivalent of the Foundry MCP `agent_update` tool: it creates a new
version of a "prompt" agent that references an already-deployed model (for example,
the `gpt-5-mini-deployment` created by the Terraform config in ../terraform/main.tf).

Configuration is read from environment variables (or a local .env file):
  AZURE_AI_PROJECT_ENDPOINT   Foundry project endpoint
  AZURE_AI_AGENT_NAME         Name of the agent to create/update
  AZURE_AI_MODEL_DEPLOYMENT   Name of the model deployment backing the agent
  AZURE_AI_AGENT_INSTRUCTIONS Optional system/developer instructions
"""

import os

from dotenv import load_dotenv
from azure.identity import DefaultAzureCredential
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import PromptAgentDefinition

load_dotenv()
DEFAULT_PROJECT_ENDPOINT="https://vivek-foundry-core-env-subdomain-2kol5a.services.ai.azure.com/api/projects/vivek-foundry-core-env-project-2kol5a"
DEFAULT_AGENT_NAME = "vivek-gpt-5-mini-agent-one"
DEFAULT_MODEL_DEPLOYMENT = "gpt-5-mini-deployment"
DEFAULT_INSTRUCTIONS = "You are a helpful assistant."


def main() -> None:
    project_endpoint = os.getenv("AZURE_AI_PROJECT_ENDPOINT", DEFAULT_PROJECT_ENDPOINT)

    if not project_endpoint:
        raise RuntimeError(
            "AZURE_AI_PROJECT_ENDPOINT is not set. Run "
            "'terraform output -raw foundry_project_api_endpoint' from the "
            "terraform directory and put that value in a .env file."
        )

    agent_name = os.getenv("AZURE_AI_AGENT_NAME", DEFAULT_AGENT_NAME)
    model_deployment = os.getenv("AZURE_AI_MODEL_DEPLOYMENT", DEFAULT_MODEL_DEPLOYMENT)
    instructions = os.getenv("AZURE_AI_AGENT_INSTRUCTIONS", DEFAULT_INSTRUCTIONS)

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
