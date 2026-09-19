using Azure.Identity;
using OpenAI;
using OpenAI.Responses;
using System.ClientModel.Primitives;

#pragma warning disable OPENAI001


namespace ResponsesClientExOne.ConsoleApp
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World!");

            const string deploymentName = "gpt-5-mini-deployment";
            // Open AI endpoint for Azure OpenAI Service 
            const string openAiEndpoint = "https://vivek-foundry-core-env-subdomain-01o8ai.openai.azure.com/openai/v1";

            BearerTokenPolicy tokenPolicy = new(
                new DefaultAzureCredential(),
                "https://ai.azure.com/.default");

            ResponsesClient client = new(
                //model: deploymentName,
                authenticationPolicy: tokenPolicy,
                options: new OpenAIClientOptions()
                {
                    Endpoint = new Uri($"{openAiEndpoint}"),
                });


            CreateResponseOptions options = new()
            {
                Model = deploymentName,
                InputItems = {
                    ResponseItem.CreateUserMessageItem("What's the weather like today for my current location?"),
                },
            };

            ResponseResult response = client.CreateResponse(options);

            Console.WriteLine($"[ASSISTANT]: {response.GetOutputText()}");
        }
    }
}
