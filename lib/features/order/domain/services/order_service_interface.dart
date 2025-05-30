abstract class OrderServiceInterface{

  Future<dynamic> getOrderList(int offset, String status, {dynamic type});

  Future<dynamic> getTrackingInfo(String orderID);

  Future<dynamic> cancelOrder(dynamic orderId);
}