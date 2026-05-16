import ballerina/ai;
import ballerina/mcp;


isolated class AiMcpbasetoolkit {
    *ai:McpBaseToolKit;
    private final mcp:StreamableHttpClient mcpClient;
    private final readonly & ai:ToolConfig[] tools;

    public isolated function init(string serverUrl, mcp:Implementation info = {name: "MCP", version: "1.0.0"},
            *mcp:StreamableHttpClientTransportConfig config) returns ai:Error? {
        do {
            self.mcpClient = check new mcp:StreamableHttpClient(serverUrl, config);
            self.tools = check ai:getPermittedMcpToolConfigs(self.mcpClient, info, self.callTool).cloneReadOnly();
        } on fail error e {
            return error ai:Error("Failed to initialize MCP toolkit", e);
        }
    }

    public isolated function getTools() returns ai:ToolConfig[] => self.tools;

    @ai:AgentTool
    public isolated function callTool(mcp:CallToolParams params) returns mcp:CallToolResult|error {
        return self.mcpClient->callTool(params);
    }
}

// Create travel itinerary using AI Agent with MCP tools
function createTravelItinerary(TravelRequest request) returns json|error {
    string RagQuery = string `Best travel package for destination ${request.destination}, budget ${request.budget} USD, interests ${request.interests.toString()}. Return package rules, itinerary, upsell options, and risk flags.`;
    ai:QueryMatch[] RagQueryResults = check aiVectorknowledgebase.retrieve(string `${RagQuery}`);

    string agentResponse = check aiAgent.run(string `Create a travel itinerary package. Customer request: Destination: ${request.destination}; Travel Date: ${request.travelDate}; Budget: ${request.budget} USD; Interests: ${request.interests.toString()}; Agent Email: ${request.agentEmail}; Client Email: ${request.clientEmail}. Internal travel package context from RAG: ${RagQueryResults.toString()}`);

    json parsedResponse = check agentResponse.fromJsonString();

    agentResponseJson agentJsonResponse = check parsedResponse.cloneWithType(agentResponseJson);

    // Send emails to client and agent using the generated itineraries and details
    check emailSmtpclient->send(string `${request.clientEmail}`, string `Your Personalized Travel Itinerary for ${request.destination}`, "\"noreply@travelagent.com\"", "\"\"", htmlBody = string `${agentJsonResponse.clientItineraryHtml}`);

    // Send internal email to agent with prospect details and next steps
    check emailSmtpclient->send(string `${request.agentEmail}`, string `Travel Itinerary Prospect Summary For ${request.clientEmail} - ${request.destination}`, "\"noreply@travelagent.com\"", "\"\"", htmlBody = string `${agentJsonResponse.prospectDetailsHtml}`);

    return {
      "status": "success",
      "message": string `Emails sent to ${request.clientEmail} and ${request.agentEmail}`,
      "destination": request.destination
    };
  

}

// Build context string from retrieved documents

final ai:Agent aiAgent = check new (
    systemPrompt = {
        role: string `AI Travel Package Assistant`,
        instructions: string `You are a travel package assistant. Steps: 1. Pick one package from the RAG context. Do not invent names. 2. Call getWeatherImpact(destination, travelDate). 3. Call findTravelPlaces(destination, interests). 4. Apply the business rules from the RAG context. Return ONLY this JSON (no markdown, no extra text): {"clientEmail":"<echo input>","agentEmail":"<echo input>","clientItineraryHtml":"<HTML for the client>","prospectDetailsHtml":"<HTML for the agent>"} HTML rules for both fields: use a single <div> root, max-width 600px, inline styles only; font Arial, 14px, color #1f2937; accent color #0ea5e9; no <style>, <script>, or external CSS. clientItineraryHtml must be warm and customer-facing, including destination header, package name and description, weather summary, day-by-day itinerary, and optional add-ons; do not include fit score, margins, or risk flags. prospectDetailsHtml must be internal and agent-facing, including package ID and name, estimated cost, fit score, budget status, business rules applied, recommended upsell, risk flags, and next action; do not include full itinerary.`
    }, model = openaiModelprovider, tools = [aiMcpbasetoolkit], maxIter = 100
);

