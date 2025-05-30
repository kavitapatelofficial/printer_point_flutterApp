import 'package:flutter_sixvalley_ecommerce/data/model/image_full_url.dart';

class CategoryModel {
  dynamic _id;
  dynamic _name;
  dynamic _slug;
  dynamic _icon;
  dynamic _parentId;
  dynamic _position;
  dynamic _createdAt;

  dynamic _updatedAt;
  List<SubCategory>? _subCategories;
  bool? isSelected;
   dynamic _thumbnail;
  ImageFullUrl? _imageFullUrl;

  CategoryModel(
      {dynamic id,
        dynamic name,
        dynamic slug,
        dynamic icon,
        dynamic parentId,
        dynamic position,
        dynamic createdAt,
        dynamic updatedAt,
           dynamic thumbnail,
        List<SubCategory>? subCategories,
        bool? isSelected,
        ImageFullUrl? imageFullUrl
      }) {
    _id = id;
    _name = name;
    _slug = slug;
    _icon = icon;
    _thumbnail=thumbnail;
    _parentId = parentId;
    _position = position;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _subCategories = subCategories;
    isSelected = isSelected;
    _imageFullUrl = imageFullUrl;
  }

  dynamic get id => _id;
  dynamic get name => _name;
  dynamic get slug => _slug;
  dynamic get icon => _icon;
  dynamic get parentId => _parentId;
  dynamic get position => _position;
  dynamic get createdAt => _createdAt;
   dynamic get thumbnail => _thumbnail;
  dynamic get updatedAt => _updatedAt;
  List<SubCategory>? get subCategories => _subCategories;
  ImageFullUrl? get imageFullUrl => _imageFullUrl;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
      _thumbnail = json['thumbnail'];
    _slug = json['slug'];
    _icon = json['icon'];
    _parentId = json['parent_id'];
    _position = json['position'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['childes'] != null) {
      _subCategories = [];
      json['childes'].forEach((v) {
        _subCategories!.add(SubCategory.fromJson(v));
      });
    }
    _imageFullUrl = json['icon_full_url'] != null
        ? ImageFullUrl.fromJson(json['icon_full_url'])
        : null;
    isSelected = false;
  }

}

class SubCategory {
  dynamic _id;
  dynamic _name;
  dynamic _slug;
  dynamic _icon;
  dynamic _parentId;
  dynamic _position;
  dynamic _createdAt;
  dynamic _updatedAt;
  List<SubSubCategory>? _subSubCategories;
  bool? isSelected;

  SubCategory(
      {dynamic id,
        dynamic name,
        dynamic slug,
        dynamic icon,
        dynamic parentId,
        dynamic position,
        dynamic createdAt,
        dynamic updatedAt,
        List<SubSubCategory>? subSubCategories,
        bool? isSelected,
      }) {
    _id = id;
    _name = name;
    _slug = slug;
    _icon = icon;
    _parentId = parentId;
    _position = position;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _subSubCategories = subSubCategories;
    isSelected = isSelected;
  }

  dynamic get id => _id;
  dynamic get name => _name;
  dynamic get slug => _slug;
  dynamic get icon => _icon;
  dynamic get parentId => _parentId;
  dynamic get position => _position;
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;
  List<SubSubCategory>? get subSubCategories => _subSubCategories;

  SubCategory.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _icon = json['icon'];
    _parentId = json['parent_id'];
    _position = json['position'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['childes'] != null) {
      _subSubCategories = [];
      json['childes'].forEach((v) {
        _subSubCategories!.add(SubSubCategory.fromJson(v));
      });
    }
    isSelected = false;
  }

}

class SubSubCategory {
  dynamic _id;
  dynamic _name;
  dynamic _slug;
  dynamic _icon;
  dynamic _parentId;
  dynamic _position;
  dynamic _createdAt;
  dynamic _updatedAt;

  SubSubCategory(
      {dynamic id,
        dynamic name,
        dynamic slug,
        dynamic icon,
        dynamic parentId,
        dynamic position,
        dynamic createdAt,
        dynamic updatedAt}) {
    _id = id;
    _name = name;
    _slug = slug;
    _icon = icon;
    _parentId = parentId;
    _position = position;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  dynamic get id => _id;
  dynamic get name => _name;
  dynamic get slug => _slug;
  dynamic get icon => _icon;
  dynamic get parentId => _parentId;
  dynamic get position => _position;
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;

  SubSubCategory.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _icon = json['icon'];
    _parentId = json['parent_id'];
    _position = json['position'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

}
