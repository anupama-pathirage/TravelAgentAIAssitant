

import ballerina/io;

isolated function loadData() returns StoreData & readonly|error {
    json data = check io:fileReadJson("data.json");
    StoreData storeData = check data.cloneWithType();
    return storeData.cloneReadOnly();
}