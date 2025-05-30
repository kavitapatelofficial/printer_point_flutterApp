import 'package:flutter_sixvalley_ecommerce/data/model/image_full_url.dart';

class SellerInfoModel {
  Seller? _seller;
  dynamic _avgRating;
  dynamic _totalReview;
  dynamic _totalOrder;
  dynamic _totalProduct;
  double? minimumOrderAmount;

  SellerInfoModel(
      {Seller? seller, dynamic avgRating, dynamic totalReview, dynamic totalOrder, dynamic totalProduct, double? minimumOrderAmount}) {
    if (seller != null) {
      _seller = seller;
    }
    if (avgRating != null) {
      _avgRating = avgRating;
    }
    if (totalReview != null) {
      _totalReview = totalReview;
    }
    if (totalOrder != null) {
      _totalOrder = totalOrder;
    }
    if (totalProduct != null) {
      _totalProduct = totalProduct;
    }
    if (minimumOrderAmount != null) {
      minimumOrderAmount = minimumOrderAmount;
    }
  }

  Seller? get seller => _seller;
  dynamic get avgRating => _avgRating;
  dynamic get totalReview => _totalReview;
  dynamic get totalOrder => _totalOrder;
  dynamic get totalProduct => _totalProduct;


  SellerInfoModel.fromJson(Map<String, dynamic> json) {
    _seller =
    json['seller'] != null ? Seller.fromJson(json['seller']) : null;
    _avgRating = json['avg_rating'].toString();
    _totalReview = json['total_review'];
    _totalOrder = json['total_order'];
    _totalProduct = json['total_product'];
    if(json['minimum_order_amount'] != null){
      try{
        minimumOrderAmount = json['minimum_order_amount'].toDouble();
      }catch(e){
        minimumOrderAmount = double.parse(json['minimum_order_amount'].toString());
      }
    }else{
      minimumOrderAmount = 0;
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_seller != null) {
      data['seller'] = _seller!.toJson();
    }
    data['avg_rating'] = _avgRating;
    data['total_review'] = _totalReview;
    data['total_order'] = _totalOrder;
    data['total_product'] = _totalProduct;
    return data;
  }
}

class Seller {
  dynamic _id;
  dynamic _fName;
  dynamic _lName;
  dynamic _phone;
  dynamic _image;
  Shop? _shop;

  Seller(
      {dynamic id,
        dynamic fName,
        dynamic lName,
        dynamic phone,
        dynamic image,
        Shop? shop}) {
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
    if (image != null) {
      _image = image;
    }
    if (shop != null) {
      _shop = shop;
    }
  }

  dynamic get id => _id;
  dynamic get fName => _fName;
  dynamic get lName => _lName;
  dynamic get phone => _phone;
  dynamic get image => _image;
  Shop? get shop => _shop;

  Seller.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _fName = json['f_name'];
    _lName = json['l_name'];
    _phone = json['phone'];
    _image = json['image'];
    _shop = json['shop'] != null ? Shop.fromJson(json['shop']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['f_name'] = _fName;
    data['l_name'] = _lName;
    data['phone'] = _phone;
    data['image'] = _image;
    if (_shop != null) {
      data['shop'] = _shop!.toJson();
    }
    return data;
  }
}

class Shop {
  dynamic _id;
  dynamic _sellerId;
  dynamic _name;
  dynamic _address;
  dynamic _contact;
  dynamic _image;
  ImageFullUrl? _imageFullUrl;
  dynamic _createdAt;
  dynamic _updatedAt;
  dynamic _banner;
  bool? _temporaryClose;
  dynamic _vacationEndDate;
  dynamic _vacationStartDate;
  bool? _vacationStatus;
  ImageFullUrl? _bannerFullUrl;

  Shop(
      {dynamic id,
        dynamic sellerId,
        dynamic name,
        dynamic address,
        dynamic contact,
        dynamic image,
        ImageFullUrl? imageFullUrl,
        dynamic createdAt,
        dynamic updatedAt,
        dynamic banner,
        bool? temporaryClose,
        dynamic vacationEndDate,
        dynamic vacationStartDate,
        bool? vacationStatus,
        ImageFullUrl? bannerFullUrl,
      }) {
    if (id != null) {
      _id = id;
    }
    if (sellerId != null) {
      _sellerId = sellerId;
    }
    if (name != null) {
      _name = name;
    }
    if (address != null) {
      _address = address;
    }
    if (contact != null) {
      _contact = contact;
    }
    if (image != null) {
      _image = image;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
    if (banner != null) {
      _banner = banner;
    }
    _temporaryClose = temporaryClose;
    _vacationEndDate = vacationEndDate;
    _vacationStartDate = vacationStartDate;
    _vacationStatus = vacationStatus;
    _imageFullUrl = imageFullUrl;
    _bannerFullUrl = bannerFullUrl;
  }

  dynamic get id => _id;
  dynamic get sellerId => _sellerId;
  dynamic get name => _name;
  dynamic get address => _address;
  dynamic get contact => _contact;
  dynamic get image => _image;
  ImageFullUrl? get imageFullUrl => _imageFullUrl;
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;
  dynamic get banner => _banner;
  bool? get temporaryClose => _temporaryClose;
  dynamic get vacationEndDate => _vacationEndDate;
  dynamic get vacationStartDate => _vacationStartDate;
  bool? get vacationStatus => _vacationStatus;
  ImageFullUrl? get bannerFullUrl => _bannerFullUrl;


  Shop.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _sellerId = int.parse(json['seller_id'].toString());
    _name = json['name'];
    _address = json['address'];
    _contact = json['contact'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _banner = json['banner'];
    _temporaryClose = json['temporary_close']??false;
    _vacationEndDate = json['vacation_end_date'];
    _vacationStartDate = json['vacation_start_date'];
    _vacationStatus = json['vacation_status']??false;
    _imageFullUrl = json['image_full_url'] != null
        ? ImageFullUrl.fromJson(json['image_full_url'])
        : null;
    _bannerFullUrl = json['banner_full_url'] != null
        ? ImageFullUrl.fromJson(json['banner_full_url'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['seller_id'] = _sellerId;
    data['name'] = _name;
    data['address'] = _address;
    data['contact'] = _contact;
    data['image'] = _image;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    data['banner'] = _banner;
    data['temporary_close'] = _temporaryClose;
    data['vacation_end_date'] = _vacationEndDate;
    data['vacation_start_date'] = _vacationEndDate;
    data['vacation_status'] = _vacationStatus;

    return data;
  }
}