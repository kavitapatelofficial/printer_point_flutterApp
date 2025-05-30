import 'package:flutter_sixvalley_ecommerce/features/search_product/domain/repositories/search_product_repository_interface.dart';
import 'package:flutter_sixvalley_ecommerce/features/search_product/domain/services/search_product_service_interface.dart';

class SearchProductService implements SearchProductServiceInterface{
  SearchProductRepositoryInterface searchProductRepositoryInterface;
  SearchProductService({required this.searchProductRepositoryInterface});

  @override
  Future<bool> clearSavedSearchProductName() async{
    return searchProductRepositoryInterface.clearSavedSearchProductName();
  }

  @override
  List<String> getSavedSearchProductName(){
    return searchProductRepositoryInterface.getSavedSearchProductName();
  }

  @override
  Future getSearchProductList(String query, dynamic categoryIds, dynamic brandIds, dynamic authorIds, dynamic publishingIds, dynamic sort, dynamic priceMin, dynamic priceMax, int offset, dynamic productType) async{
    return await searchProductRepositoryInterface.getSearchProductList(query, categoryIds, brandIds, authorIds, publishingIds, sort, priceMin, priceMax, offset, productType);
  }

  @override
  Future getSearchProductName(String name) async{
    return searchProductRepositoryInterface.getSearchProductName(name);
  }

  @override
  Future saveSearchProductName(String searchAddress) async{
    return await searchProductRepositoryInterface.saveSearchProductName(searchAddress);
  }

  @override
  Future getAuthorList(dynamic sellerId){
    return searchProductRepositoryInterface.getAuthorList(sellerId);
  }

  @override
  Future getPublishingHouse(dynamic sellerId){
    return searchProductRepositoryInterface.getPublishingHouse(sellerId);
  }


}