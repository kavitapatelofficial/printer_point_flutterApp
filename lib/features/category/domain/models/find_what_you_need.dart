import 'package:flutter_sixvalley_ecommerce/data/model/image_full_url.dart';

class FindWhatYouNeedModel {
  List<FindWhatYouNeed>? findWhatYouNeed;

  FindWhatYouNeedModel({this.findWhatYouNeed});

  FindWhatYouNeedModel.fromJson(Map<String, dynamic> json) {
    if (json['find_what_you_need'] != null) {
      findWhatYouNeed = <FindWhatYouNeed>[];
      json['find_what_you_need'].forEach((v) {
        findWhatYouNeed!.add(FindWhatYouNeed.fromJson(v));
      });
    }
  }

}

class FindWhatYouNeed {
  dynamic id;
  dynamic name;
  dynamic slug;
  dynamic icon;
  ImageFullUrl? iconFullUrl;
  dynamic parentId;
  dynamic position;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic homeStatus;
  dynamic priority;
  dynamic productCount;
  List<Childes>? childes;

  FindWhatYouNeed(
      {this.id,
        this.name,
        this.slug,
        this.icon,
        this.parentId,
        this.position,
        this.createdAt,
        this.updatedAt,
        this.homeStatus,
        this.priority,
        this.productCount,
        this.childes,
        this.iconFullUrl
      });

  FindWhatYouNeed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    icon = json['icon'];
    parentId = json['parent_id'];
    position = json['position'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    homeStatus = json['home_status'];
    priority = json['priority'];
    productCount = int.parse(json['product_count'].toString());
    if (json['icon_full_url'] != null) {
      iconFullUrl = ImageFullUrl.fromJson(json['icon_full_url']);
    }
    if (json['childes'] != null) {
      childes = <Childes>[];
      json['childes'].forEach((v) {
        childes!.add(Childes.fromJson(v));
      });
    }

  }

}

class Childes {
  dynamic id;
  dynamic name;
  dynamic slug;
  dynamic icon;
  ImageFullUrl? iconFullUrl;
  dynamic parentId;
  dynamic position;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic homeStatus;
  dynamic priority;
  dynamic subCategoryProductCount;


  Childes(
      {this.id,
        this.name,
        this.slug,
        this.icon,
        this.parentId,
        this.position,
        this.createdAt,
        this.updatedAt,
        this.homeStatus,
        this.priority,
        this.subCategoryProductCount,
        this.iconFullUrl});

  Childes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    icon = json['icon'];
    parentId = json['parent_id'];
    position = json['position'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    homeStatus = json['home_status'];
    priority = json['priority'];
    subCategoryProductCount = int.parse(json['sub_category_product_count'].toString());
    if (json['icon_full_url'] != null) {
      iconFullUrl = ImageFullUrl.fromJson(json['icon_full_url']);
    }
  }
}
