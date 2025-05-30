import 'package:flutter_sixvalley_ecommerce/data/model/image_full_url.dart';
import 'package:flutter_sixvalley_ecommerce/features/product/domain/models/product_model.dart';

class BannerModel {
  dynamic id;
  dynamic photo;
  dynamic bannerType;
  dynamic published;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic url;
  dynamic resourceType;
  dynamic resourceId;
  Product? product;
  dynamic title;
  dynamic subTitle;
  dynamic buttonText;
  dynamic backgroundColor;
  ImageFullUrl? photoFullUrl;

  BannerModel(
      {this.id,
      this.photo,
      this.bannerType,
      this.published,
      this.createdAt,
      this.updatedAt,
      this.url,
      this.resourceType,
      this.resourceId,
      this.product,
      this.title,
      this.subTitle,
      this.buttonText,
      this.backgroundColor,
      this.photoFullUrl});

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    bannerType = json['banner_type'];
    published = json['published'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    url = json['url'];
    resourceType = json['resource_type'];
    resourceId = json['resource_id'];
    title = json['title'];
    subTitle = json['sub_title'];
    buttonText = json['button_text'];
    backgroundColor = json['background_color'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    photoFullUrl = json['photo_full_url'] != null
        ? ImageFullUrl.fromJson(json['photo_full_url'])
        : null;
  }
}
