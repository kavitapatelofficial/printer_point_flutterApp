import 'package:flutter_sixvalley_ecommerce/features/shipping/domain/repositories/shipping_repository_interface.dart';
import 'package:flutter_sixvalley_ecommerce/features/shipping/domain/services/shipping_service_interface.dart';

class ShippingService implements ShippingServiceInterface{
  ShippingRepositoryInterface shippingRepositoryInterface;
  ShippingService({required this.shippingRepositoryInterface});

  @override
  Future addShippingMethod(dynamic id, dynamic cartGroupId) async{
    return await shippingRepositoryInterface.addShippingMethod(id,cartGroupId);
  }
  @override
  Future getChosenShippingMethod() async{
    return await shippingRepositoryInterface.getChosenShippingMethod();
  }


  @override
  Future getShippingMethod(dynamic sellerId, dynamic type) async {
    return await shippingRepositoryInterface.getShippingMethod(sellerId, type);
  }


}