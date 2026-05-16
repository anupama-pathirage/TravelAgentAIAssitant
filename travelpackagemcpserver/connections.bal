import ballerina/http;

final http:Client geocodingApi = check new ("https://geocoding-api.open-meteo.com/v1");
final http:Client weatherApi = check new ("https://api.open-meteo.com/v1");
final http:Client placesApi = check new ("https://api.geoapify.com/v2");

