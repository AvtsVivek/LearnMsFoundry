using Azure.AI.Extensions.OpenAI;
using Azure.AI.Projects;
using Azure.Identity;
using OpenAI.Responses;

namespace AzureAiDotNetConsoleApp
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string projectEndpoint = "https://vivek-foundry-core-env-subdomain-0imtub.services.ai.azure.com/" +
                "api/projects/vivek-foundry-core-env-project-0imtub";

            AIProjectClient projectClient = new(
                endpoint: new Uri(projectEndpoint),
                tokenProvider: new DefaultAzureCredential());

            ProjectResponsesClient responseClient = projectClient.ProjectOpenAIClient
                .GetProjectResponsesClientForModel("gpt-5-mini-deployment");

#pragma warning disable OPENAI001
            ResponseResult response = responseClient.CreateResponse("What is the size of France in square miles?");

            Console.WriteLine($"Response output: {response.GetOutputText()}");
#pragma warning restore OPENAI001

        }
    }
}



/*
using Azure.Identity; 
using OpenAI;
using OpenAI.Responses;
using System.ClientModel.Primitives;

#pragma warning disable OPENAI001

const string deploymentName = "gpt-5-mini-deployment";
const string endpoint = "https://vivek-foundry-core-env-0imtub.services.ai.azure.com/openai/v1";

BearerTokenPolicy tokenPolicy = new(
    new DefaultAzureCredential(),
    "https://ai.azure.com/.default");

ResponsesClient client = new(
    model: deploymentName,
    authenticationPolicy: tokenPolicy,
    options: new OpenAIClientOptions()
    {
        Endpoint = new Uri($"{endpoint}"),
    });
CreateResponseOptions options = new()
{
    InputItems =
    {
        ResponseItem.CreateUserMessageItem("What's the weather like today for my current location?"),
    },
};

ResponseResult response = client.CreateResponse(options);

Console.WriteLine($"[ASSISTANT]: {response.GetOutputText()}");

*/ 