class ShippingMethodModel {
  dynamic id;
  dynamic creatorType;
  dynamic title;
  double? cost;
  dynamic duration;
  dynamic createdAt;
  dynamic updatedAt;

  ShippingMethodModel(
      {this.id,
        this.creatorType,
        this.title,
        this.cost,
        this.duration,
        this.createdAt,
        this.updatedAt});



  ShippingMethodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    creatorType = json['creator_type'];
    title = json['title'];
    if(json['cost'] != null){
      try{
        cost = json['cost'].toDouble();
      }catch(e){
        cost = double.parse(json['cost'].toString());
      }
    }

    duration = json['duration'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}
