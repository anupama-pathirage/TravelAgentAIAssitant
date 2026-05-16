
type WeatherImpactResponse record {|
    string summary;
    string recommendation;
    decimal maxTemperature;
    int rainProbability;
|};

type findTravelPlacesResponseItem record {|
    string name;
    string category;
    string address;
    decimal latitude;
    decimal longitude;
|};

type findTravelPlacesResponse findTravelPlacesResponseItem[];

type Postcodes string[];

type ResultsItem record {|
    int id;
    string name;
    decimal latitude;
    decimal longitude;
    decimal elevation;
    string feature_code;
    string country_code;
    int admin1_id;
    int admin2_id;
    string timezone;
    int population;
    Postcodes postcodes;
    int country_id;
    string country;
    string admin1;
    string admin2;
|};

type Results ResultsItem[];

type geocodingApiResponseType record {|
    Results results;
    decimal generationtime_ms;
|};

type Daily_units record {|
    string time;
    string temperature_2m_max;
    string precipitation_probability_max;
|};

type Time string[];

type Temperature_2m_max decimal[];

type Precipitation_probability_max int[];

type Daily record {|
    Time time;
    Temperature_2m_max temperature_2m_max;
    Precipitation_probability_max precipitation_probability_max;
|};

type WeatherAPIResponseType record {|
    decimal latitude;
    decimal longitude;
    decimal generationtime_ms;
    int utc_offset_seconds;
    string timezone;
    string timezone_abbreviation;
    int elevation;
    Daily_units daily_units;
    Daily daily;
|};

// Geoapify Places API Types
type PlacesApiResponseType record {|
    string 'type;
    Feature[] features?;
|};

type Feature record {|
    string 'type;
    Properties properties;
    Geometry geometry;
|};

type Properties record {|
    json...;
|};

type Geometry record {|
    string 'type;
    decimal[]? coordinates;
|};

type Interests string[];

type TravelRequest record {|
    string destination;
    string travelDate;
    Interests interests;
    int budget;
|};
