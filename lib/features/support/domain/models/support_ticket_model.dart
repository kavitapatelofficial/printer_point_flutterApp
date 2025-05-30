class SupportTicketModel {
  dynamic _id;
  dynamic _customerId;
  dynamic _subject;
  dynamic _type;
  dynamic _priority;
  dynamic _description;
  dynamic _reply;
  dynamic _status;
  dynamic _createdAt;
  dynamic _updatedAt;

  SupportTicketModel(
      {dynamic id,
        dynamic customerId,
        dynamic subject,
        dynamic type,
        dynamic priority,
        dynamic description,
        dynamic reply,
        dynamic status,
        dynamic createdAt,
        dynamic updatedAt}) {
    _id = id;
    _customerId = customerId;
    _subject = subject;
    _type = type;
    _priority = priority;
    _description = description;
    _reply = reply;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  dynamic get id => _id;
  dynamic get customerId => _customerId;
  dynamic get subject => _subject;
  dynamic get type => _type;
  dynamic get priority => _priority;
  dynamic get description => _description;
  dynamic get reply => _reply;
  dynamic get status => _status;
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;

  SupportTicketModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _customerId = json['customer_id'];
    _subject = json['subject'];
    _type = json['type'];
    _priority = json['priority'];
    _description = json['description'];
    _reply = json['reply'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['customer_id'] = _customerId;
    data['subject'] = _subject;
    data['type'] = _type;
    data['priority'] = _priority;
    data['description'] = _description;
    data['reply'] = _reply;
    data['status'] = _status;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}
