class ResponseModel {
  final dynamic _message;
  final bool _isSuccess;

  ResponseModel(this._message, this._isSuccess);

  bool get isSuccess => _isSuccess;
  dynamic get message => _message;
}