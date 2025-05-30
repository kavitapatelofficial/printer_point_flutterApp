class ChosenShippingMethodModel {
  dynamic _id;
  dynamic _cartGroupId;
  dynamic _shippingMethodId;
  double? _shippingCost;
  dynamic _createdAt;
  dynamic _updatedAt;
  dynamic _isCheckItemExist;

  ChosenShippingMethodModel(
      {dynamic id,
        dynamic cartGroupId,
        dynamic shippingMethodId,
        double? shippingCost,
        dynamic createdAt,
        dynamic updatedAt,
        dynamic isCheckItemExist}) {
    _id = id;
    _cartGroupId = cartGroupId;
    _shippingMethodId = shippingMethodId;
    _shippingCost = shippingCost;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _isCheckItemExist = isCheckItemExist;
  }

  dynamic get id => _id;
  dynamic get cartGroupId => _cartGroupId;
  dynamic get shippingMethodId => _shippingMethodId;
  double? get shippingCost => _shippingCost;
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;
  dynamic get isCheckItemExist => _isCheckItemExist;

  ChosenShippingMethodModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _cartGroupId = json['cart_group_id'];
    _shippingMethodId = int.parse(json['shipping_method_id'].toString());
    _shippingCost = double.parse(json['shipping_cost'].toString());
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _isCheckItemExist = json['is_check_item_exist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['cart_group_id'] = _cartGroupId;
    data['shipping_method_id'] = _shippingMethodId;
    data['shipping_cost'] = _shippingCost;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    data['is_check_item_exist'] = _isCheckItemExist;
    return data;
  }
}
