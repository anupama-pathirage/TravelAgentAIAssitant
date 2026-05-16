import ballerina/ai;
import ballerina/http;
import ballerina/io;

/// Updates the knowledge base by writing the uploaded request body to a file and ingesting
/// the document data into the vector database.
///
/// @param request The HTTP request containing the uploaded file stream.
/// @return A JSON object indicating the operation status.
function updateKB(http:Request request) returns json {

    
    // Writes the incoming stream to a file using the `io:fileWriteBlocksFromStream` API
    // by providing the file location to which the content should be written.
    do {
        stream<byte[], io:Error?> streamer = check request.getByteStream();
	    // Writes the incoming stream to a file using the `io:fileWriteBlocksFromStream` API
	    // by providing the file location to which the content should be written.
	    check io:fileWriteBlocksFromStream("./files/ReceivedFile.md", streamer);
        check streamer.close();

        //read the file uploaded and ingest to vector db

        ai:Document[]|ai:Document kbFileData = check kbDataLoader.load();
        check aiVectorknowledgebase.ingest(kbFileData);
        
        return "{ 'status': 'Successful' }";



    } on fail error err {
        io:println("Error while writing the file: " + err.message());
        return "{ 'status': 'Failed' }";
    }

    

}
