import 'package:flutter_sixvalley_ecommerce/interface/repo_interface.dart';

abstract class ShippingRepositoryInterface<T> implements RepositoryInterface{

  Future<dynamic> getShippingMethod(dynamic sellerId, dynamic type);

  Future<dynamic> addShippingMethod(dynamic id, dynamic cartGroupId);

  Future<dynamic> getChosenShippingMethod();

}