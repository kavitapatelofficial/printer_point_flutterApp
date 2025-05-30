import 'package:flutter_sixvalley_ecommerce/interface/repo_interface.dart';

abstract class LoyaltyPointRepositoryInterface implements RepositoryInterface{
  Future<dynamic> convertPointToCurrency(int point);

  @override
  Future<dynamic> getList({dynamic offset = 1, dynamic filterBy, DateTime? startDate, DateTime? endDate, List<String>? transactionTypes});

}