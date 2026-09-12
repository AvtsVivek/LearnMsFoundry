# Before running the sample:
#    pip install azure-ai-projects>=2.1.0

from azure.identity import DefaultAzureCredential
from azure.ai.projects import AIProjectClient

endpoint = "https://vivek-foundry-core-env-subdomain-9qb9jc.services.ai.azure.com/api/projects/vivek-foundry-core-env-project-9qb9jc"

project_client = AIProjectClient(
    endpoint=endpoint,
    credential=DefaultAzureCredential(),
)

# Define the agent and version to be used for the request.
# This information will be used to reference the specific agent when making requests.
# The agent and version are specified by the variables `my_agent` and `my_version`.
# These variables are used later in the `extra_body` parameter when creating the response.
# Define the agent and version before making the request.
# Make sure to set these variables correctly before making the request.
# These are available from the ai.azure.com portal or your project configuration.
# Set the agent and version to the appropriate values for your use case.
my_agent = "vivek-gpt-5-mini-agent-one"
my_version = "1"

# agent = project_client.get_agent(my_agent, my_version)
agent = project_client.agents.get(agent_name=my_agent)

print(f"Agent name: {agent.name}")
print(f"")
print(f"___________________________________________________________________________________________________")
print(f"")
print(f"Agent details: {agent}")
print(f"")
print(f"___________________________________________________________________________________________________")
print(f"")

openai_client = project_client.get_openai_client()

# Reference the agent to get a response
response = openai_client.responses.create(
    input=[{"role": "user", "content": "Tell me what you can help with."}],
    extra_body={"agent_reference": {"name": my_agent, "version": my_version, "type": "agent_reference"}},
)

print(f"Response output: {response.output_text}")