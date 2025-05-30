class SelectedShippingType {
  dynamic _sellerId;
  dynamic _selectedShippingType;

  SelectedShippingType({dynamic sellerId, dynamic selectedShippingType}) {
    if (sellerId != null) {
      _sellerId = sellerId;
    }
    if (selectedShippingType != null) {
      _selectedShippingType = selectedShippingType;
    }
  }

  dynamic get sellerId => _sellerId;
  dynamic get selectedShippingType => _selectedShippingType;

  SelectedShippingType.fromJson(Map<String, dynamic> json) {
    _sellerId = json['sellerId'];
    _selectedShippingType = json['selectedShippingType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sellerId'] = _sellerId;
    data['selectedShippingType'] = _selectedShippingType;
    return data;
  }
}
