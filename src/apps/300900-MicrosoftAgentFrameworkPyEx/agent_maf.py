
import os
import sys
import asyncio
from dotenv import load_dotenv

from agent_framework.foundry import FoundryAgent
from azure.identity.aio import DefaultAzureCredential

load_dotenv()

PROMPT = "Tell me a joke about robot pirates."


async def main():
    project_endpoint = os.environ["AZURE_AI_PROJECT_ENDPOINT"]
    agent_name = os.getenv("AZURE_AI_AGENT_NAME", "vivek-gpt-5-mini-agent-twenty-five")

    print(f"Project Endpoint: {project_endpoint}")
    print(f"Agent Name: {agent_name}")

    sys.stdout.reconfigure(encoding="utf-8", errors="replace")

    async with DefaultAzureCredential() as credential:
        agent = FoundryAgent(
            project_endpoint=project_endpoint,
            agent_name=agent_name,
            credential=credential,
        )

        result = await agent.run(PROMPT)
        print(result.text)


print(f"Starting the agent script...")
print(f"")
print(f"___________________________________________________________________________________________________")
print(f"")

if __name__ == "__main__":
    asyncio.run(main())

print(f"")
print(f"___________________________________________________________________________________________________")
print(f"")
print(f"Finished running the agent script...")

