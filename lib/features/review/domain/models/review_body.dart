class ReviewBody {
  dynamic _id;
  dynamic _orderId;
  dynamic _productId;
  dynamic _comment;
  dynamic _rating;
  List<String>? _fileUpload;

  ReviewBody(
      {
        dynamic id,
        dynamic orderId,
        dynamic productId,
        dynamic comment,
        dynamic rating,
        List<String>? fileUpload}) {
    _id = id;
    _orderId = orderId;
    _productId = productId;
    _comment = comment;
    _rating = rating;
    _fileUpload = fileUpload;

  }

  dynamic get id => _id;
  dynamic get orderId => _orderId;
  dynamic get productId => _productId;
  dynamic get comment => _comment;
  dynamic get rating => _rating;
  List<String>? get fileUpload => _fileUpload;

  ReviewBody.fromJson(Map<String, dynamic> json) {
    _id = json["id"];
    _orderId = json["order_id"];
    _productId = json['product_id'];
    _comment = json['comment'];
    _rating = json['rating'];
    _fileUpload = json['fileUpload'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = _id;
    data["order_id"] = _orderId;
    data['product_id'] = _productId;
    data['comment'] = _comment;
    data['rating'] = _rating;
    data['fileUpload'] = _fileUpload;
    return data;
  }
}
