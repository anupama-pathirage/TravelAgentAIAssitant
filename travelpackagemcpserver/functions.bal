// Find travel places for a destination based on interests
function findTravelPlaces(string destination, string[] interests) returns findTravelPlacesResponse|error {
    // Step 1: Get geocoding information for the destination


    geocodingApiResponseType geocodingApiResponse = check geocodingApi->/search.get(
        name = destination,
        count = "1",
        language = "en",
        format = "json"
    );

    // Extract latitude and longitude from the first result
    ResultsItem[]? results = geocodingApiResponse.results;
    if results is () || results.length() == 0 {
        return error(string `Location not found: ${destination}`);
    }

    ResultsItem locationResult = results[0];
    decimal latitude = locationResult.latitude;
    decimal longitude = locationResult.longitude;

    // Step 2: Map interests to Geoapify categories
    string categories = mapInterestsToCategories(interests);

    // Step 3: Call Geoapify Places API
    // Note: Geoapify uses longitude,latitude,radius format for circle filter
    string circleFilter = string `circle:${longitude},${latitude},10000`;
    
    PlacesApiResponseType placesResponse = check placesApi->/places.get(
        categories = categories,
        filter = circleFilter,
        'limit = "10",
        apiKey = GEOAPIFY_API_KEY
    );

    // Step 4: Transform response to match expected format
    findTravelPlacesResponse travelPlaces = [];
    
    Feature[]? features = placesResponse.features;
    if features is () {
        return travelPlaces;
    }

    foreach Feature feature in features {
        Properties properties = feature.properties;
        Geometry geometry = feature.geometry;
        
        // Extract name, default to formatted address if name is not available
        string? nameValue = check properties["name"].ensureType();
        string formattedValue = check properties["formatted"].ensureType();
        string placeName = nameValue ?: formattedValue;
        
        // Extract category from categories array
        string category = "general";
        json categoriesJson = properties["categories"];
        if categoriesJson is json[] && categoriesJson.length() > 0 {
            string[]? categoriesArray = check categoriesJson.cloneWithType();
            if categoriesArray is string[] && categoriesArray.length() > 0 {
                category = categoriesArray[categoriesArray.length() - 1];
            }
        }
        
        // Extract address
        string? addressLine2 = check properties["address_line2"].ensureType();
        string address = addressLine2 ?: formattedValue;
        
        // Extract coordinates
        decimal[]? coordinates = geometry.coordinates;
        decimal placeLatitude = 0.0;
        decimal placeLongitude = 0.0;
        
        if coordinates is decimal[] && coordinates.length() >= 2 {
            placeLongitude = coordinates[0];
            placeLatitude = coordinates[1];
        }
        
        travelPlaces.push({
            name: placeName,
            category: category,
            address: address,
            latitude: placeLatitude,
            longitude: placeLongitude
        });
    }
    
    return travelPlaces;
}

// Map user interests to Geoapify categories
function mapInterestsToCategories(string[] interests) returns string {
    string[] categoryList = [];
    
    foreach string interest in interests {
        string lowerInterest = interest.toLowerAscii();
        
        match lowerInterest {
            "romantic" => {
                categoryList.push("catering.restaurant");
                categoryList.push("leisure.park");
            }
            "shows" => {
                categoryList.push("entertainment");
                categoryList.push("entertainment.culture");
            }
            "good food"|"food" => {
                categoryList.push("catering.restaurant");
                categoryList.push("catering.cafe");
            }
            "scenic" => {
                categoryList.push("tourism.sights");
                categoryList.push("leisure.park");
            }
            "family" => {
                categoryList.push("entertainment");
                categoryList.push("leisure.park");
            }
            "culture" => {
                categoryList.push("tourism.sights");
                categoryList.push("entertainment.culture");
            }
            _ => {
                // Default categories
                categoryList.push("tourism.sights");
            }
        }
    }
    
    // Remove duplicates and join
    string[] uniqueCategories = [];
    foreach string cat in categoryList {
        boolean exists = false;
        foreach string uniqueCat in uniqueCategories {
            if uniqueCat == cat {
                exists = true;
                break;
            }
        }
        if !exists {
            uniqueCategories.push(cat);
        }
    }
    
    // If no categories mapped, use default
    if uniqueCategories.length() == 0 {
        return "tourism.sights,catering.restaurant,leisure.park,entertainment";
    }
    
    return string:'join(",", ...uniqueCategories);
}

// Get weather impact for a destination and date
function getWeatherImpact(string destination, string date) returns WeatherImpactResponse|error {
    // Step 1: Get geocoding information for the destination
    geocodingApiResponseType geocodingApiResponse = check geocodingApi->/search.get(
        name = destination,
        count = "1",
        language = "en",
        format = "json"
    );

    // Extract latitude and longitude from the first result
    ResultsItem[]? results = geocodingApiResponse.results;
    if results is () || results.length() == 0 {
        return error(string `Location not found: ${destination}`);
    }

    ResultsItem locationResult = results[0];
    decimal latitude = locationResult.latitude;
    decimal longitude = locationResult.longitude;

    // Step 2: Get weather forecast using coordinates and date
    WeatherAPIResponseType weatherResponse = check weatherApi->/forecast.get(
        latitude = latitude.toString(),
        longitude = longitude.toString(),
        daily = "temperature_2m_max,precipitation_probability_max",
        timezone = "auto",
        start_date = date,
        end_date = date
    );

    // Extract weather data from the response
    decimal maxTemperature = 0.0;
    int rainProbability = 0;

    if weatherResponse.daily.temperature_2m_max.length() > 0 {
        maxTemperature = weatherResponse.daily.temperature_2m_max[0];
    }

    if weatherResponse.daily.precipitation_probability_max.length() > 0 {
        rainProbability = weatherResponse.daily.precipitation_probability_max[0];
    }

    // Generate summary and recommendation based on weather conditions
    string summary = string `Weather forecast for ${locationResult.name} on ${date}: Maximum temperature ${maxTemperature}°C with ${rainProbability}% chance of rain.`;
    
    string recommendation = "";
    if rainProbability > 70 {
        recommendation = "High chance of rain. Bring an umbrella and plan indoor activities.";
    } else if rainProbability > 30 {
        recommendation = "Moderate chance of rain. Consider bringing rain gear.";
    } else {
        recommendation = "Low chance of rain. Great weather for outdoor activities!";
    }

    if maxTemperature > 35.0d {
        recommendation = recommendation + " Very hot weather expected. Stay hydrated and use sun protection.";
    } else if maxTemperature < 10.0d {
        recommendation = recommendation + " Cold weather expected. Dress warmly.";
    }

    return {
        summary: summary,
        recommendation: recommendation,
        maxTemperature: maxTemperature,
        rainProbability: rainProbability
    };
}
