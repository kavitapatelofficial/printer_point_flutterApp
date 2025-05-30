import 'package:flutter_sixvalley_ecommerce/features/shipping/domain/models/shipping_method_model.dart';

class ShippingModel{
  dynamic shippingIndex;
  dynamic groupId;
  List<ShippingMethodModel>? shippingMethodList;

  ShippingModel(this.shippingIndex, this.groupId, this.shippingMethodList);
}