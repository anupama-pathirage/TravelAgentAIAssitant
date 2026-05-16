type Interests string[];

type TravelRequest record {|
    string destination;
    string travelDate;
    Interests interests;
    int budget;
    string agentEmail;
    string clientEmail;
|};

type agentResponseJson record {|
    string clientEmail;
    string agentEmail;
    string clientItineraryHtml;
    string prospectDetailsHtml;
|};
