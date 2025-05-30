class SupportTicketBody {
  dynamic _type;
  dynamic _subject;
  dynamic _description;
  dynamic _priority;

  SupportTicketBody(String type, String subject, String description, String priority) {
    _type = type;
    _subject = subject;
    _description = description;
    _priority = priority;
  }

  dynamic get type => _type;
  dynamic get subject => _subject;
  dynamic get description => _description;
  dynamic get priority => _priority;

  SupportTicketBody.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _subject = json['subject'];
    _description = json['description'];
    _priority = json['priority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = _type;
    data['subject'] = _subject;
    data['description'] = _description;
    data['priority'] = _priority;
    return data;
  }
}
