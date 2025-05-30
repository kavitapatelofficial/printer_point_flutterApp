
abstract class WalletServiceInterface {

  // Future<dynamic> getWalletTransactionList(int offset, String types, String startDate, String endDate, String filterByType);

  Future<dynamic> addFundToWallet(String amount, String paymentMethod);

  Future<dynamic> getWalletBonusBannerList();

  Future<dynamic> getList({dynamic offset = 1, dynamic filterBy, DateTime? startDate, DateTime? endDate, List<String>? transactionTypes});


}