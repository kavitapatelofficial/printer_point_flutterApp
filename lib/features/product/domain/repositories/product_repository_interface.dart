import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/features/product/enums/product_type.dart';
import 'package:flutter_sixvalley_ecommerce/interface/repo_interface.dart';

abstract class ProductRepositoryInterface<T> extends RepositoryInterface {

  Future<dynamic> getFilteredProductList(BuildContext context, String offset,
      ProductType productType, dynamic title);

  Future<dynamic> getBrandOrCategoryProductList({required bool isBrand, required int id, required int offset});

  Future<dynamic> getRelatedProductList(String id);

  Future<dynamic> getFeaturedProductList(String offset);

  Future<dynamic> getLatestProductList(String offset);

  Future<dynamic> getRecommendedProduct();

  Future<dynamic> getMostDemandedProduct();

  Future<dynamic> getFindWhatYouNeed();

  Future<dynamic> getJustForYouProductList();

  Future<dynamic> getMostSearchingProductList(int offset);

  Future<dynamic> getHomeCategoryProductList();

  Future<dynamic> getClearanceAllProductList(String offset);

  Future<dynamic> getClearanceSearchProducts(String query, dynamic categoryIds, dynamic brandIds, dynamic authorIds, dynamic publishingIds, dynamic sort, dynamic priceMin, dynamic priceMax, int offset, dynamic productType, dynamic offerType);

}