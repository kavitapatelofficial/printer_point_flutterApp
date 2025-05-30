import 'package:flutter_sixvalley_ecommerce/features/checkout/domain/repositories/checkout_repository_interface.dart';
import 'package:flutter_sixvalley_ecommerce/features/checkout/domain/services/checkout_service_interface.dart';

class CheckoutService implements CheckoutServiceInterface{
  CheckoutRepositoryInterface checkoutRepositoryInterface;


  CheckoutService({required this.checkoutRepositoryInterface});

  @override
  Future cashOnDeliveryPlaceOrder({dynamic addressID,
    dynamic couponCode,
    dynamic couponDiscountAmount,
    dynamic billingAddressId,
    dynamic orderNote,
    bool? isCheckCreateAccount,
    dynamic password,
    double? cashChangeAmount,
    dynamic currentCurrencyCode,
  }) async{
    return await checkoutRepositoryInterface.cashOnDeliveryPlaceOrder(
     addressID: addressID,
      couponCode: couponCode,
      couponDiscountAmount: couponDiscountAmount,
      billingAddressId: billingAddressId,
      orderNote: orderNote,
      isCheckCreateAccount: isCheckCreateAccount,
      password: password,
      cashChangeAmount: cashChangeAmount,
      currentCurrencyCode: currentCurrencyCode,
    );
  }

  @override
  Future digitalPaymentPlaceOrder(dynamic orderNote, dynamic customerId, dynamic addressId, dynamic billingAddressId, dynamic couponCode, dynamic couponDiscount, dynamic paymentMethod, bool? isCheckCreateAccount, dynamic password) async {
    return await checkoutRepositoryInterface.digitalPaymentPlaceOrder(orderNote, customerId, addressId, billingAddressId, couponCode, couponDiscount, paymentMethod, isCheckCreateAccount, password);
  }

  @override
  Future offlinePaymentList()  async{
   return await checkoutRepositoryInterface.offlinePaymentList();
  }

  @override
  Future offlinePaymentPlaceOrder(dynamic addressID, dynamic couponCode, dynamic couponDiscountAmount, dynamic billingAddressId, dynamic orderNote, List<String?> typeKey, List<String> typeValue, dynamic id, String name, dynamic paymentNote,bool? isCheckCreateAccount, dynamic password) async{
    return await checkoutRepositoryInterface.offlinePaymentPlaceOrder(addressID, couponCode, couponDiscountAmount, billingAddressId, orderNote, typeKey, typeValue, id, name, paymentNote, isCheckCreateAccount, password);
  }

  @override
  Future walletPaymentPlaceOrder(dynamic addressID, dynamic couponCode, dynamic couponDiscountAmount, dynamic billingAddressId, dynamic orderNote, bool? isCheckCreateAccount, dynamic password) async{
    return await checkoutRepositoryInterface.walletPaymentPlaceOrder(addressID, couponCode, couponDiscountAmount, billingAddressId, orderNote, isCheckCreateAccount, password);
  }

}