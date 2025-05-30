

import 'package:flutter_sixvalley_ecommerce/data/model/image_full_url.dart';
import 'package:flutter_sixvalley_ecommerce/features/shop/domain/models/seller_model.dart';

class OrderModel {
  dynamic totalSize;
  dynamic limit;
  dynamic offset;
  List<Orders>? orders;

  OrderModel({this.totalSize, this.limit, this.offset, this.orders});

  OrderModel.fromJson(Map<String, dynamic> json) {
    totalSize = json['total_size'];
    limit = json['limit'];
    offset = json['offset'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(Orders.fromJson(v));
      });
    }
  }

}

class Orders {
  dynamic id;
  dynamic customerId;
  dynamic isGuest;
  dynamic customerType;
  dynamic paymentStatus;
  dynamic orderStatus;
  dynamic paymentMethod;
  dynamic transactionRef;
  dynamic paymentBy;
  dynamic paymentNote;
  double? orderAmount;
  double? paidAmount;
  dynamic adminCommission;
  dynamic cause;
  dynamic createdAt;
  dynamic updatedAt;
  double? discountAmount;
  dynamic discountType;
  dynamic couponCode;
  dynamic couponDiscountBearer;
  dynamic shippingMethodId;
  double? shippingCost;
  bool? isShippingFree;
  dynamic orderGroupId;
  dynamic verificationCode;
  bool? verificationStatus;
  dynamic sellerId;
  dynamic sellerIs;
  ShippingAddressData? shippingAddressData;
  dynamic deliveryManId;
  double? deliverymanCharge;
  dynamic expectedDeliveryDate;
  dynamic orderNote;
  dynamic billingAddress;
  BillingAddressData? billingAddressData;
  dynamic orderType;
  double? extraDiscount;
  dynamic extraDiscountType;
  dynamic freeDeliveryBearer;
  dynamic shippingType;
  dynamic deliveryType;
  dynamic deliveryServiceName;
  dynamic thirdPartyDeliveryTrackingId;
  dynamic orderDetailsCount;
  List<Details>? details;
  DeliveryMan? deliveryMan;
  Seller? seller;
  double? bringChangeAmount;
  dynamic bringChangeAmountCurrency;


      Orders(
      {this.id,
        this.customerId,
        this.isGuest,
        this.customerType,
        this.paymentStatus,
        this.orderStatus,
        this.paymentMethod,
        this.transactionRef,
        this.paymentBy,
        this.paymentNote,
        this.orderAmount,
        this.paidAmount,
        this.adminCommission,
        this.cause,
        this.createdAt,
        this.updatedAt,
        this.discountAmount,
        this.discountType,
        this.couponCode,
        this.couponDiscountBearer,
        this.shippingMethodId,
        this.shippingCost,
        this.isShippingFree,
        this.orderGroupId,
        this.verificationCode,
        this.verificationStatus,
        this.sellerId,
        this.sellerIs,
        this.shippingAddressData,
        this.deliveryManId,
        this.deliverymanCharge,
        this.expectedDeliveryDate,
        this.orderNote,
        this.billingAddress,
        this.billingAddressData,
        this.orderType,
        this.extraDiscount,
        this.extraDiscountType,
        this.freeDeliveryBearer,
        this.shippingType,
        this.deliveryType,
        this.deliveryServiceName,
        this.thirdPartyDeliveryTrackingId,
        this.orderDetailsCount,
        this.details,
        this.deliveryMan,
        this.seller,
        this.bringChangeAmount,
        this.bringChangeAmountCurrency,

      });

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    if(json['temporary_close'] != null){
      isGuest = int.parse(json['temporary_close'].toString());
    }else{
      isGuest = 0;
    }

    customerType = json['customer_type'];
    paymentStatus = json['payment_status'];
    orderStatus = json['order_status'];
    paymentMethod = json['payment_method'];
    transactionRef = json['transaction_ref'];
    paymentBy = json['payment_by'];
    paymentNote = json['payment_note'];
    orderAmount = json['order_amount'].toDouble();
    if (json['paid_amount'] != null) {
      paidAmount = json['paid_amount'].toDouble();
    }else{
      paidAmount = 0;
    }
    adminCommission = json['admin_commission'];
    cause = json['cause'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    discountAmount = json['discount_amount'].toDouble();
    discountType = json['discount_type'];
    couponCode = json['coupon_code'];
    couponDiscountBearer = json['coupon_discount_bearer'];
    shippingMethodId = json['shipping_method_id'];
    shippingCost = json['shipping_cost'].toDouble();
    isShippingFree = json['is_shipping_free']??false;
    orderGroupId = json['order_group_id'];
    verificationCode = json['verification_code'];
    verificationStatus = json['verification_status']??false;
    sellerId = json['seller_id'];
    sellerIs = json['seller_is'];
    shippingAddressData = json['shipping_address_data'] != null ? ShippingAddressData.fromJson(json['shipping_address_data']) : null;
    deliveryManId = json['delivery_man_id'];
    if(json['deliveryman_charge'] != null){
      deliverymanCharge = double.parse(json['deliveryman_charge'].toString());
    }else{
      deliverymanCharge = 0;
    }

    expectedDeliveryDate = json['expected_delivery_date'];
    orderNote = json['order_note'];
    billingAddress = json['billing_address'];
    billingAddressData = json['billing_address_data'] != null ? BillingAddressData.fromJson(json['billing_address_data']) : null;
    orderType = json['order_type'];
    extraDiscount = json['extra_discount'].toDouble();
    extraDiscountType = json['extra_discount_type'];
    freeDeliveryBearer = json['free_delivery_bearer'];
    shippingType = json['shipping_type'];
    deliveryType = json['delivery_type'];
    deliveryServiceName = json['delivery_service_name'];
    thirdPartyDeliveryTrackingId = json['third_party_delivery_tracking_id'];
    if(json['order_details_count'] != null){
      orderDetailsCount = int.parse(json['order_details_count'].toString());
    }else{
      orderDetailsCount = 0;
    }

    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(Details.fromJson(v));
      });
    }
    deliveryMan = json['delivery_man'] != null ? DeliveryMan.fromJson(json['delivery_man']) : null;
    seller = json['seller'] != null ? Seller.fromJson(json['seller']) : null;
    bringChangeAmount = double.tryParse('${json['bring_change_amount']}');
    bringChangeAmountCurrency = json['bring_change_amount_currency'];
  }

}


class BillingAddressData {
  dynamic id;
  dynamic contactPersonName;
  dynamic addressType;
  dynamic address;
  dynamic city;
  dynamic zip;
  dynamic phone;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic country;
  dynamic latitude;
  dynamic longitude;

  BillingAddressData(
      {this.id,
        this.contactPersonName,
        this.addressType,
        this.address,
        this.city,
        this.zip,
        this.phone,
        this.createdAt,
        this.updatedAt,
        this.country,
        this.latitude,
        this.longitude});

  BillingAddressData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contactPersonName = json['contact_person_name'];
    addressType = json['address_type'];
    address = json['address'];
    city = json['city'];
    zip = json['zip'];
    phone = json['phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    country = json['country'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

}

class ShippingAddressData {
  dynamic _id;
  dynamic _contactPersonName;
  dynamic _addressType;
  dynamic _address;
  dynamic _city;
  dynamic _zip;
  dynamic _phone;
  dynamic _createdAt;
  dynamic _updatedAt;
  dynamic _country;

  ShippingAddressData(
      {dynamic id,
        dynamic contactPersonName,
        dynamic addressType,
        dynamic address,
        dynamic city,
        dynamic zip,
        dynamic phone,
        dynamic createdAt,
        dynamic updatedAt,
        void state,
        dynamic country}) {
    if (id != null) {
      _id = id;
    }

    if (contactPersonName != null) {
      _contactPersonName = contactPersonName;
    }
    if (addressType != null) {
      _addressType = addressType;
    }
    if (address != null) {
      _address = address;
    }
    if (city != null) {
      _city = city;
    }
    if (zip != null) {
      _zip = zip;
    }
    if (phone != null) {
      _phone = phone;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }

    if (country != null) {
      _country = country;
    }
  }

  dynamic get id => _id;
  dynamic get contactPersonName => _contactPersonName;
  dynamic get addressType => _addressType;
  dynamic get address => _address;
  dynamic get city => _city;
  dynamic get zip => _zip;
  dynamic get phone => _phone;
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;
  dynamic get country => _country;


  ShippingAddressData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _contactPersonName = json['contact_person_name'];
    _addressType = json['address_type'];
    _address = json['address'];
    _city = json['city'];
    _zip = json['zip'];
    _phone = json['phone'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _country = json['country'];
  }

}

class DeliveryMan {
  dynamic _id;
  dynamic _fName;
  dynamic _lName;
  dynamic _phone;
  dynamic _email;
  dynamic _image;
  DeliveryMan(
      {
        dynamic id,
        dynamic fName,
        dynamic lName,
        dynamic phone,
        dynamic email,
        dynamic image
      }) {

    if (id != null) {
      _id = id;
    }
    if (fName != null) {
      _fName = fName;
    }
    if (lName != null) {
      _lName = lName;
    }
    if (phone != null) {
      _phone = phone;
    }
    if (email != null) {
      _email = email;
    }

    if (image != null) {
      _image = image;
    }

  }


  dynamic get id => _id;
  dynamic get fName => _fName;
  dynamic get lName => _lName;
  dynamic get phone => _phone;
  dynamic get email => _email;
  dynamic get image => _image;

  DeliveryMan.fromJson(Map<String, dynamic> json) {

    _id = json['id'];
    _fName = json['f_name'];
    _lName = json['l_name'];
    _phone = json['phone'];
    _email = json['email'];
    _image = json['image'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = _id;
    data['f_name'] = _fName;
    data['l_name'] = _lName;
    data['phone'] = _phone;
    data['email'] = _email;
    data['image'] = _image;
    return data;
  }
}



class Shop {
  dynamic image;
  dynamic name;
  Shop(
      {this.image, this.name});

  Shop.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
  }
}


class Details {
  Product? product;
  dynamic qty;
  double? price;
  double? tax;
  double? discount;

  Details(
    {
      this.product,
      this.qty,
      this.price,
      this.tax,
      this.discount
    });

  Details.fromJson(Map<String, dynamic> json) {
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
    qty = json['qty'];
    price = json['price'].toDouble();
    tax = json['tax'].toDouble();
    discount = json['discount'].toDouble();
  }

}

class Product {
  dynamic thumbnail;
  dynamic productType;
  ImageFullUrl? thumbnailFullUrl;


  Product(
      {this.thumbnail, this.productType, this.thumbnailFullUrl});

  Product.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'];
    productType = json['product_type'];
    thumbnailFullUrl = json['thumbnail_full_url'] != null
      ? ImageFullUrl.fromJson(json['thumbnail_full_url'])
      : null;

  }


}
