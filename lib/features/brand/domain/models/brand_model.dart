import 'package:flutter_sixvalley_ecommerce/data/model/image_full_url.dart';


class Brand {
  dynamic totalSize;
  dynamic limit;
  dynamic offset;
  List<BrandModel>? brands;

  Brand({this.totalSize, this.limit, this.offset, this.brands});

  Brand.fromJson(Map<String, dynamic> json) {
    totalSize = json['total_size'];
    limit = json['limit'];
    offset = json['offset'];
    if (json['brands'] != null) {
      brands = <BrandModel>[];
      json['brands'].forEach((v) {
        brands!.add(BrandModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_size'] = totalSize;
    data['limit'] = limit;
    data['offset'] = offset;
    return data;
  }
}



class BrandModel {
  dynamic _id;
  dynamic _name;
  dynamic _image;
  dynamic _status;
  dynamic _createdAt;
  dynamic _updatedAt;
  dynamic _brandProductsCount;
  bool? checked;
  ImageFullUrl? _imageFullUrl;


  BrandModel(
      {dynamic id,
        dynamic name,
        dynamic image,
        dynamic status,
        dynamic createdAt,
        dynamic updatedAt,
        dynamic brandProductsCount,
        bool? checked,
        ImageFullUrl? imageFullUrl,
      }) {
    _id = id;
    _name = name;
    _image = image;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _brandProductsCount = brandProductsCount;
    _imageFullUrl = imageFullUrl;
    checked = checked;

  }

  dynamic get id => _id;
  dynamic get name => _name;
  dynamic get image => _image;
  dynamic get status => _status;
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;
  dynamic get brandProductsCount => _brandProductsCount;
  ImageFullUrl? get imageFullUrl => _imageFullUrl;


  BrandModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _brandProductsCount = json['brand_products_count'];
    _imageFullUrl = json['image_full_url'] != null
        ? ImageFullUrl.fromJson(json['image_full_url'])
        : null;
    checked = false;

  }

}
