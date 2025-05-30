import 'package:flutter_sixvalley_ecommerce/interface/repo_interface.dart';

abstract class SearchProductRepositoryInterface implements RepositoryInterface{

  Future<dynamic> getSearchProductList(String query, dynamic categoryIds, dynamic brandIds, dynamic authorIds, dynamic publishingIds, dynamic sort, dynamic priceMin, dynamic priceMax, int offset, dynamic productType);
  Future<dynamic> getSearchProductName(String name);
  Future<dynamic> saveSearchProductName(String searchAddress);
  List<String> getSavedSearchProductName();
  Future<bool> clearSavedSearchProductName();
  Future<dynamic> getAuthorList(dynamic sellerId);
  Future<dynamic> getPublishingHouse(dynamic sellerId);
}