abstract class ShippingServiceInterface{
  Future<dynamic> getShippingMethod(dynamic sellerId, dynamic type);

  Future<dynamic> addShippingMethod(dynamic id, dynamic cartGroupId);

  Future<dynamic> getChosenShippingMethod();


}