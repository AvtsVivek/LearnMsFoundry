using Azure.Identity;

using System.Net.Http.Headers;
using System.Text;
using System.Text.Json;

#pragma warning disable OPENAI001


namespace AnthropicClientNetEx.ConsoleApp
{
    internal class Program
    {
        static async Task Main(string[] args)
        {
            Console.WriteLine("Hello, World!");

            const string deploymentName = "claude-sonnet-4-6-deployment";

            var credential = new DefaultAzureCredential();
            var token = await credential.GetTokenAsync(
                new Azure.Core.TokenRequestContext(new[] { "https://ai.azure.com/.default" }));
            using var httpClient = new HttpClient();
            httpClient.DefaultRequestHeaders.Authorization =
                new AuthenticationHeaderValue("Bearer", token.Token);
            httpClient.DefaultRequestHeaders.Add("anthropic-version", "2023-06-01");
            var requestBody = new
            {
                model = deploymentName,
                messages = new[]
                {
                    new { role = "user", content = "Name three Seattle attractions." }
                },
                max_tokens = 1048
            };
            string endpoint = "https://vivek-foundry-core-env-subdomain-lg0kjr.services.ai.azure.com/anthropic/v1/messages";
            var anthropicResponse = await httpClient.PostAsync(
                endpoint,
                new StringContent(
                    JsonSerializer.Serialize(requestBody), Encoding.UTF8,
                    "application/json"));

            string result = await anthropicResponse.Content.ReadAsStringAsync();
            Console.WriteLine(result);

        }
    }
}
