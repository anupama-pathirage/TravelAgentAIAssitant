
import ballerina/mcp;

final StoreData & readonly storeData = check loadData();
final Product[] & readonly catalog = storeData.products;
final map<Order> & readonly orders = storeData.orders;

listener mcp:Listener mcpListener = new (8080);

@mcp:ServiceConfig {
    info: {
        name: "ShopEasy MCP Server",
        version: "1.0.0"
    }
}
service mcp:Service /mcp on mcpListener {
    # "Search the product catalog by keyword. Returns all matching products with name, category, price, and stock level."
    #
    # + keyword - A word or phrase to match against product name or category
    # + return - A list of matching products
    @mcp:Tool
    remote function searchProducts(string keyword) returns Product[] {
        return from Product p in catalog
            where p.name.toLowerAscii().includes(keyword.toLowerAscii())
                || p.category.toLowerAscii().includes(keyword.toLowerAscii())
            select p;
    }

    # Get the current status of a customer order.
    #
    # + orderId - The order ID (for example, ORD-042)
    # + return - Order details including status and estimated delivery, or an error if not found
    remote function getOrderStatus(string orderId) returns Order|error {
        Order? orderRecord = orders[orderId];
        if orderRecord is Order {
            return orderRecord;
        }
        return error(string `Order '${orderId}' was not found.`);
    }

    # Submit a return request for a delivered order.
    # Only orders with status "Delivered" are eligible for return.
    #
    # + orderId - The order ID to return
    # + reason - Reason for the return (for example, "damaged", "wrong item", "no longer needed")
    # + return - A return confirmation with a reference ID, or an error if the order is not eligible
    remote function submitReturnRequest(string orderId, string reason) returns ReturnConfirmation|error {
        Order? orderRecord = orders[orderId];
        if orderRecord is () {
            return error(string `Order '${orderId}' was not found.`);
        }
        if orderRecord.status != "Delivered" {
            return error(string `Order '${orderId}' is not eligible for return. Current status: ${orderRecord.status}.`);
        }
        string returnId = string `RET-${orderId.substring(4)}`;
        return {
            orderId,
            returnId,
            message: string `Return request accepted. Your return ID is ${returnId}. A prepaid label will be emailed within 2 business days.`
        };
    }

}
