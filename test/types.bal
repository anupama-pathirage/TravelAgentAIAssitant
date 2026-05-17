

type Product record {|
    string id;
    string name;
    string category;
    float price;
    int stock;
|};

type Order record {|
    string orderId;
    string customerName;
    string[] items;
    string status;
    string estimatedDelivery;
|};

type ReturnConfirmation record {|
    string orderId;
    string returnId;
    string message;
|};

type StoreData record {|
    Product[] products;
    map<Order> orders;
|};