
abstract class LoyaltyPointServiceInterface {
  Future<dynamic> getList({dynamic offset = 1, dynamic filterBy, DateTime? startDate, DateTime? endDate, List<String>? transactionTypes});
  Future<dynamic> convertPointToCurrency(int point);
}