
class MessageBody {
  dynamic _id;
  dynamic _message;

  MessageBody({dynamic id, dynamic message}) {
    _id = id;
    _message = message;
  }

  dynamic get id => _id;
  dynamic get message => _message;

  MessageBody.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['message'] = _message;
    return data;
  }
}
