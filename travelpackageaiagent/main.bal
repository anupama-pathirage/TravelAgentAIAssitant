import ballerina/http;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service /TravelItineraryAPI on httpDefaultListener {
    resource function post create\-itinerary(@http:Payload TravelRequest payload) returns json|error {
        return createTravelItinerary(payload);
    }

    resource function post update\-kb(http:Request request) returns error|json {
        return updateKB(request);
    }

}