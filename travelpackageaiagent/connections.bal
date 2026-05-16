import ballerina/ai;
import ballerina/email;
import ballerinax/ai.openai;
import ballerinax/ai.pinecone;

final ai:TextDataLoader kbDataLoader = check new ("./files/ReceivedFile.md");

final pinecone:VectorStore pineconeVectorstore = check new ("https://travelpackage-3a9c20c.svc.aped-4627-b74a.pinecone.io", string `${PINECONE_KEY}`);
final openai:EmbeddingProvider openaiEmbeddingprovider = check new (string `${OPEN_AI_KEY}`, "text-embedding-3-small");
final ai:VectorKnowledgeBase aiVectorknowledgebase = new (pineconeVectorstore, openaiEmbeddingprovider);
final openai:ModelProvider openaiModelprovider = check new (string `${OPEN_AI_KEY}`, "gpt-4o-mini", maxTokens = 4000);

final AiMcpbasetoolkit aiMcpbasetoolkit = check new ("http://localhost:8080/mcp");
final email:SmtpClient emailSmtpclient = check new ("smtp.gmail.com", string `${EMAIL_USERNAME}`, string `${EMAIL_PASSWORD}`);
