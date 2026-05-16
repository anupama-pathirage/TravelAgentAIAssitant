import ballerina/mcp;

listener mcp:Listener mcpListener = new (8080);

@mcp:ServiceConfig {
    info: {
        name: "TravelToolsMCP",
        version: "1.0.0"
    }
}
service mcp:Service /mcp on mcpListener {

    # + destination - Destination city name, for example Las Vegas or Austin.
    # + date - "Travel date which needs to get the results eg : 2026-05-20"
    remote function getWeatherImpact(string destination, string date) returns WeatherImpactResponse|error {
        return getWeatherImpact(destination, date);
    }

    # "Finds nearby attractions, restaurants, parks, and entertainment places for a destination."
    #
    # + destination - Destination city name, for example Las Vegas or Austin.
    # + interests - Customer interests such as romantic, shows, good food, scenic, family, or culture.
    # + return - findTravelPlacesResponse
    remote function findTravelPlaces(string destination, string[] interests) returns findTravelPlacesResponse|error {
        return findTravelPlaces(destination, interests);
    }

}

