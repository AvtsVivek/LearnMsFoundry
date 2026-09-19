using Azure.Identity;
using OpenAI;
using OpenAI.Responses;
using System.ClientModel.Primitives;

#pragma warning disable OPENAI001


namespace OpenAIClientNetEx.ConsoleApp
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World!");

            const string deploymentName = "gpt-5-mini-deployment";
            // Open AI endpoint for Azure OpenAI Service 

            const string openAiEndpoint = "https://vivek-foundry-core-env-subdomain-v10suv.openai.azure.com/openai/v1";

            BearerTokenPolicy tokenPolicy = new(
                new DefaultAzureCredential(),
                "https://ai.azure.com/.default");

            OpenAIClient openAIClient = new(
                authenticationPolicy: tokenPolicy,
                options: new OpenAIClientOptions()
                {
                    Endpoint = new(openAiEndpoint),
                });

            ResponsesClient responsesClient = openAIClient.GetResponsesClient();

            CreateResponseOptions options = new()
            {
                Model = deploymentName,
                InputItems = {
                    ResponseItem.CreateUserMessageItem("What is the size of France in square miles?"),
                },
            };

            var azureOpenAIResponse = responsesClient.CreateResponse(options);
            Console.WriteLine($"Response output: {azureOpenAIResponse.Value.GetOutputText()}");
        }
    }
}
