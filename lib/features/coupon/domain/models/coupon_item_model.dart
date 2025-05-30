
import 'package:flutter_sixvalley_ecommerce/features/shop/domain/models/seller_model.dart';

class CouponItemModel {
  dynamic totalSize;
  dynamic limit;
  dynamic offset;
  List<Coupons>? coupons;

  CouponItemModel({this.totalSize, this.limit, this.offset, this.coupons});

  CouponItemModel.fromJson(Map<String, dynamic> json) {
    totalSize = json['total_size'];
    limit = json['limit'];
    offset = json['offset'];
    if (json['coupons'] != null) {
      coupons = <Coupons>[];
      json['coupons'].forEach((v) {
        coupons!.add(Coupons.fromJson(v));
      });
    }
  }

}

class Coupons {
  dynamic id;
  dynamic addedBy;
  dynamic couponType;
  dynamic couponBearer;
  dynamic sellerId;
  dynamic title;
  dynamic code;
  dynamic limit;
  Seller? seller;
  dynamic expireDate;
  dynamic expireDatePlanText;
  dynamic planExpireDate;
  double? discount;
  dynamic discountType;
  double? minPurchase;
  dynamic orderCount;

  Coupons(
      {this.id,
        this.addedBy,
        this.couponType,
        this.couponBearer,
        this.sellerId,
        this.title,
        this.code,
        this.limit,
        this.seller,
        this.expireDate,
        this.planExpireDate,
        this.expireDatePlanText,
        this.discount,
        this.discountType,
        this.minPurchase,
        this.orderCount,
      });

  Coupons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addedBy = json['added_by'];
    couponType = json['coupon_type'];
    couponBearer = json['coupon_bearer'];
    title = json['title'];
    code = json['code'];
    sellerId = json['seller_id'];
    if(json['limit'] != null){
      limit = int.parse(json['limit'].toString());
    }

    seller = json['seller'] != null ? Seller.fromJson(json['seller']) : null;
    expireDate = json['expire_date'];
    planExpireDate = json['plain_expire_date'];
    expireDatePlanText = json['plain_expire_date'];
    if(json['discount'] != null){
      discount = json['discount'].toDouble();
    }
    if(json['min_purchase'] != null){
      minPurchase = json['min_purchase'].toDouble();
    }

    discountType = json['discount_type'];
    if(json['order_count'] != null){
      try{
        orderCount = json['order_count'];
      }catch(e){
        orderCount = int.parse(json['order_count'].toString());
      }
    }else{
      orderCount = 0;
    }

  }

}
