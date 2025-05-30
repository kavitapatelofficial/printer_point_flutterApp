class CouponModel {
  dynamic _id;
  dynamic _couponType;
  dynamic _title;
  dynamic _code;
  dynamic _startDate;
  dynamic _expireDate;
  double? _minPurchase;
  double? _maxDiscount;
  double? _discount;
  dynamic _discountType;
  dynamic _status;
  dynamic _createdAt;
  dynamic _updatedAt;

  CouponModel(
      {dynamic id,
        dynamic couponType,
        dynamic title,
        dynamic code,
        dynamic startDate,
        dynamic expireDate,
        double? minPurchase,
        double? maxDiscount,
        double? discount,
        dynamic discountType,
        dynamic status,
        dynamic createdAt,
        dynamic updatedAt}) {
    _id = id;
    _couponType = couponType;
    _title = title;
    _code = code;
    _startDate = startDate;
    _expireDate = expireDate;
    _minPurchase = minPurchase;
    _maxDiscount = maxDiscount;
    _discount = discount;
    _discountType = discountType;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  dynamic get id => _id;
  dynamic get couponType => _couponType;
  dynamic get title => _title;
  dynamic get code => _code;
  dynamic get startDate => _startDate;
  dynamic get expireDate => _expireDate;
  double? get minPurchase => _minPurchase;
  double? get maxDiscount => _maxDiscount;
  double? get discount => _discount;
  dynamic get discountType => _discountType;
  dynamic get status => _status;
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;

  CouponModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _couponType = json['coupon_type'];
    _title = json['title'];
    if(json['code'] != null){
      _code = json['code'];
    }else{
      _code = '';
    }
    _startDate = json['start_date'];
    _expireDate = json['expire_date'];
    _minPurchase = json['min_purchase'].toDouble();
    _maxDiscount = json['max_discount'].toDouble();
    _discount = json['discount'].toDouble();
    _discountType = json['discount_type'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['coupon_type'] = _couponType;
    data['title'] = _title;
    data['code'] = _code;
    data['start_date'] = _startDate;
    data['expire_date'] = _expireDate;
    data['min_purchase'] = _minPurchase;
    data['max_discount'] = _maxDiscount;
    data['discount'] = _discount;
    data['discount_type'] = _discountType;
    data['status'] = _status;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}
