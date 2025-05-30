abstract class CheckoutServiceInterface{

  Future<dynamic> cashOnDeliveryPlaceOrder({
    dynamic addressID,
    dynamic couponCode,
    dynamic couponDiscountAmount,
    dynamic billingAddressId,
    dynamic orderNote,
    bool? isCheckCreateAccount,
    dynamic password,
    double? cashChangeAmount,
    dynamic currentCurrencyCode,
  });

  Future<dynamic> offlinePaymentPlaceOrder(dynamic addressID, dynamic couponCode, dynamic couponDiscountAmount, dynamic billingAddressId, dynamic orderNote, List <String?> typeKey, List<String> typeValue, dynamic id, String name, dynamic paymentNote,bool? isCheckCreateAccount, dynamic password);

  Future<dynamic> walletPaymentPlaceOrder(dynamic addressID, dynamic couponCode,dynamic couponDiscountAmount, dynamic billingAddressId, dynamic orderNote, bool? isCheckCreateAccount, dynamic password);

  Future<dynamic> digitalPaymentPlaceOrder(dynamic orderNote, dynamic customerId, dynamic addressId, dynamic billingAddressId, dynamic couponCode, dynamic couponDiscount, dynamic paymentMethod, bool? isCheckCreateAccount, dynamic password);

  Future<dynamic> offlinePaymentList();
}