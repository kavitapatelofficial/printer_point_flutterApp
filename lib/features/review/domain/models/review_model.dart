import 'package:flutter_sixvalley_ecommerce/data/model/image_full_url.dart';

class ReviewModel {
  dynamic _id;
  dynamic _productId;
  dynamic _customerId;
  dynamic _comment;
  List<String>? _attachment;
  dynamic _rating;
  dynamic _status;
  dynamic _createdAt;
  dynamic _updatedAt;
  Customer? _customer;
  Reply? _reply;
  List<ImageFullUrl>? _attachmentFullUrl;

  ReviewModel(
      {dynamic id,
        dynamic productId,
        dynamic customerId,
        dynamic comment,
        List<String>? attachment,
        dynamic rating,
        dynamic status,
        dynamic createdAt,
        dynamic updatedAt,
        Customer? customer,
        Reply? reply,
        List<ImageFullUrl>? attachmentFullUrl}) {
    _id = id;
    _productId = productId;
    _customerId = customerId;
    _comment = comment;
    _attachment = attachment;
    _rating = rating;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _customer = customer;
    _attachmentFullUrl = attachmentFullUrl;
    if (reply != null) {
      _reply = reply;
    }
  }

  dynamic get id => _id;
  dynamic get productId => _productId;
  dynamic get customerId => _customerId;
  dynamic get comment => _comment;
  List<String>? get attachment => _attachment;
  dynamic get rating => _rating;
  dynamic get status => _status;
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;
  Customer? get customer => _customer;
  Reply? get reply => _reply;
  List<ImageFullUrl>? get attachmentFullUrl => _attachmentFullUrl;

  ReviewModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _productId = int.parse(json['product_id'].toString());
    _customerId = int.parse(json['customer_id'].toString());
    _comment = json['comment'];
    if(json['attachment'] != null && json['attachment'] is List){
      _attachment = json['attachment'].cast<String>();
    }
    _rating = json['rating'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _customer = json['customer'] != null
        ? Customer.fromJson(json['customer'])
        : null;
    _reply = json['reply'] != null ? Reply.fromJson(json['reply']) : null;
    if (json['attachment_full_url'] != null) {
      _attachmentFullUrl = <ImageFullUrl>[];
      json['attachment_full_url'].forEach((v) {
        _attachmentFullUrl!.add(ImageFullUrl.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['product_id'] = _productId;
    data['customer_id'] = _customerId;
    data['comment'] = _comment;
    if (_customer != null) {
      data['customer'] = _customer!.toJson();
    }
    data['rating'] = _rating;
    data['status'] = _status;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    if (_customer != null) {
      data['customer'] = _customer!.toJson();
    }
    if (_reply != null) {
      data['reply'] = _reply!.toJson();
    }
    return data;
  }
}

class Customer {
  dynamic _id;
  dynamic _name;
  dynamic _fName;
  dynamic _lName;
  dynamic _phone;
  dynamic _image;
  dynamic _email;
  dynamic _emailVerifiedAt;
  dynamic _createdAt;
  dynamic _updatedAt;
  dynamic _streetAddress;
  dynamic _country;
  dynamic _city;
  dynamic _zip;
  dynamic _houseNo;
  dynamic _apartmentNo;
  ImageFullUrl? _imageFullUrl;

  Customer(
      {dynamic id,
        dynamic name,
        dynamic fName,
        dynamic lName,
        dynamic phone,
        dynamic image,
        dynamic email,
        dynamic emailVerifiedAt,
        dynamic createdAt,
        dynamic updatedAt,
        dynamic streetAddress,
        dynamic country,
        dynamic city,
        dynamic zip,
        dynamic houseNo,
        dynamic apartmentNo,
        ImageFullUrl? imageFullUrl}) {
    _id = id;
    _name = name;
    _fName = fName;
    _lName = lName;
    _phone = phone;
    _image = image;
    _email = email;
    _emailVerifiedAt = emailVerifiedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _streetAddress = streetAddress;
    _country = country;
    _city = city;
    _zip = zip;
    _houseNo = houseNo;
    _apartmentNo = apartmentNo;
    _imageFullUrl = imageFullUrl;
  }

  dynamic get id => _id;
  dynamic get name => _name;
  dynamic get fName => _fName;
  dynamic get lName => _lName;
  dynamic get phone => _phone;
  dynamic get image => _image;
  dynamic get email => _email;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;
  dynamic get streetAddress => _streetAddress;
  dynamic get country => _country;
  dynamic get city => _city;
  dynamic get zip => _zip;
  dynamic get houseNo => _houseNo;
  dynamic get apartmentNo => _apartmentNo;
  ImageFullUrl? get imageFullUrl => _imageFullUrl;

  Customer.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _fName = json['f_name'];
    _lName = json['l_name'];
    _phone = json['phone'];
    _image = json['image'];
    _email = json['email'];
    _emailVerifiedAt = json['email_verified_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _streetAddress = json['street_address'];
    _country = json['country'];
    _city = json['city'];
    _zip = json['zip'];
    _houseNo = json['house_no'];
    _apartmentNo = json['apartment_no'];
    _imageFullUrl = json['image_full_url'] != null
        ? ImageFullUrl.fromJson(json['image_full_url'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['f_name'] = _fName;
    data['l_name'] = _lName;
    data['phone'] = _phone;
    data['image'] = _image;
    data['email'] = _email;
    data['email_verified_at'] = _emailVerifiedAt;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    data['street_address'] = _streetAddress;
    data['country'] = _country;
    data['city'] = _city;
    data['zip'] = _zip;
    data['house_no'] = _houseNo;
    data['apartment_no'] = _apartmentNo;
    return data;
  }
}



class Reply {
  dynamic _id;
  dynamic _reviewId;
  dynamic _addedById;
  dynamic _addedBy;
  dynamic _replyText;
  dynamic _createdAt;
  dynamic _updatedAt;

  Reply(
      {dynamic id,
        dynamic reviewId,
        dynamic addedById,
        dynamic addedBy,
        dynamic replyText,
        dynamic createdAt,
        dynamic updatedAt}) {
    if (id != null) {
      _id = id;
    }
    if (reviewId != null) {
      _reviewId = reviewId;
    }
    if (addedById != null) {
      _addedById = addedById;
    }
    if (addedBy != null) {
      _addedBy = addedBy;
    }
    if (replyText != null) {
      _replyText = replyText;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
  }

  dynamic get id => _id;
  set id(dynamic id) => _id = id;
  dynamic get reviewId => _reviewId;
  set reviewId(dynamic reviewId) => _reviewId = reviewId;
  dynamic get addedById => _addedById;
  set addedById(dynamic addedById) => _addedById = addedById;
  dynamic get addedBy => _addedBy;
  set addedBy(dynamic addedBy) => _addedBy = addedBy;
  dynamic get replyText => _replyText;
  set replyText(dynamic replyText) => _replyText = replyText;
  dynamic get createdAt => _createdAt;
  set createdAt(dynamic createdAt) => _createdAt = createdAt;
  dynamic get updatedAt => _updatedAt;
  set updatedAt(dynamic updatedAt) => _updatedAt = updatedAt;

  Reply.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _reviewId = json['review_id'];
    _addedById = json['added_by_id'];
    _addedBy = json['added_by'];
    _replyText = json['reply_text'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['review_id'] = _reviewId;
    data['added_by_id'] = _addedById;
    data['added_by'] = _addedBy;
    data['reply_text'] = _replyText;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}