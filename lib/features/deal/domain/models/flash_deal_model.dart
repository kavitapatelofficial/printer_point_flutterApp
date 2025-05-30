    class FlashDealModel {
  dynamic _id;
  dynamic _title;
  dynamic _startDate;
  dynamic _endDate;
  dynamic _backgroundColor;
  dynamic _textColor;
  dynamic _banner;
  dynamic _slug;
  dynamic _createdAt;
  dynamic _updatedAt;
  dynamic _productId;
  dynamic _dealType;

  FlashDealModel(
      {dynamic id,
        dynamic title,
        dynamic startDate,
        dynamic endDate,
        dynamic backgroundColor,
        dynamic textColor,
        dynamic banner,
        dynamic slug,
        dynamic createdAt,
        dynamic updatedAt,
        dynamic productId,
        dynamic dealType}) {
    _id = id;
    _title = title;
    _startDate = startDate;
    _endDate = endDate;
    _backgroundColor = backgroundColor;
    _textColor = textColor;
    _banner = banner;
    _slug = slug;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _productId = productId;
    _dealType = dealType;
  }

  dynamic get id => _id;
  dynamic get title => _title;
  dynamic get startDate => _startDate;
  dynamic get endDate => _endDate;
  dynamic get backgroundColor => _backgroundColor;
  dynamic get textColor => _textColor;
  dynamic get banner => _banner;
  dynamic get slug => _slug;
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;
  dynamic get productId => _productId;
  dynamic get dealType => _dealType;

  FlashDealModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _backgroundColor = json['background_color'];
    _textColor = json['text_color'];
    _banner = json['banner'];
    _slug = json['slug'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _productId = json['product_id'];
    _dealType = json['deal_type'];
  }

}
