import 'package:flutter_sixvalley_ecommerce/data/model/image_full_url.dart';
import 'package:flutter_sixvalley_ecommerce/features/product/domain/models/product_model.dart';

class WishlistModel {
  dynamic id;
  dynamic customerId;
  dynamic productId;
  dynamic createdAt;
  dynamic updatedAt;
  ProductFullInfo? productFullInfo;

  WishlistModel(
      {this.id,
        this.customerId,
        this.productId,
        this.createdAt,
        this.updatedAt,
        this.productFullInfo});

  WishlistModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productFullInfo = json['product_full_info'] != null ? ProductFullInfo.fromJson(json['product_full_info']) : null;
  }


}

class ProductFullInfo {
  dynamic id;
  dynamic addedBy;
  dynamic userId;
  dynamic name;
  dynamic slug;
  dynamic productType;
  dynamic brandId;
  dynamic unit;
  dynamic minQty;
  dynamic refundable;
  dynamic colorImage;
  dynamic thumbnail;
  ImageFullUrl? thumbnailFullUrl;
  dynamic featured;
  dynamic videoProvider;
  dynamic colors;
  dynamic variantProduct;
  dynamic attributes;
  dynamic choiceOptions;
  dynamic variation;
  dynamic published;
  double? unitPrice;
  double? purchasePrice;
  double? tax;
  dynamic taxType;
  dynamic taxModel;
  double? discount;
  dynamic discountType;
  dynamic currentStock;
  dynamic minimumOrderQty;
  dynamic details;
  dynamic freeShipping;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic status;
  dynamic featuredStatus;
  dynamic metaTitle;
  dynamic metaDescription;
  dynamic metaImage;
  dynamic requestStatus;

  double? shippingCost;
  dynamic multiplyQty;

  dynamic code;
  dynamic reviewsCount;

  ClearanceSale? clearanceSale;


  ProductFullInfo(
      {this.id,
        this.addedBy,
        this.userId,
        this.name,
        this.slug,
        this.productType,
        this.brandId,
        this.unit,
        this.minQty,
        this.refundable,
        this.colorImage,
        this.thumbnail,
        this.thumbnailFullUrl,
        this.featured,
        this.videoProvider,
        this.colors,
        this.variantProduct,
        this.attributes,
        this.choiceOptions,
        this.variation,
        this.published,
        this.unitPrice,
        this.purchasePrice,
        this.tax,
        this.taxType,
        this.taxModel,
        this.discount,
        this.discountType,
        this.currentStock,
        this.minimumOrderQty,
        this.details,
        this.freeShipping,
        this.createdAt,
        this.updatedAt,
        this.status,
        this.featuredStatus,
        this.metaTitle,
        this.metaDescription,
        this.metaImage,
        this.requestStatus,
        this.shippingCost,
        this.multiplyQty,
        this.code,
        this.reviewsCount,
        this.clearanceSale,
        });

  ProductFullInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addedBy = json['added_by'];
    userId = json['user_id'];
    name = json['name'];
    slug = json['slug'];
    productType = json['product_type'];
    brandId = json['brand_id'];
    unit = json['unit'];
    minQty = json['min_qty'];
    refundable = json['refundable'];
    colorImage = json['color_image'];
    thumbnail = json['thumbnail'];
    featured = json['featured'];
    videoProvider = json['video_provider'];
    colors = json['colors'];
    variantProduct = int.tryParse(json['variant_product'].toString());
    attributes = json['attributes'];
    choiceOptions = json['choice_options'];
    variation = json['variation'];
    published = json['published'];
    unitPrice = json['unit_price'].toDouble();
    purchasePrice = double.parse(json['purchase_price'].toString());
    tax = double.parse(json['tax'].toString());
    taxType = json['tax_type'];
    taxModel = json['tax_model'];
    discount = json['discount'].toDouble();
    discountType = json['discount_type'];
    currentStock = json['current_stock'];
    minimumOrderQty = int.parse(json['minimum_order_qty'].toString());
    details = json['details'];
    freeShipping = json['free_shipping'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    featuredStatus = json['featured_status'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    metaImage = json['meta_image'];
    requestStatus = int.parse(json['request_status'].toString());
    shippingCost = double.parse(json['shipping_cost'].toString());
    multiplyQty = json['multiply_qty'];
    code = json['code'];
    if(json['reviews_count'] != null){
      reviewsCount = int.parse(json['reviews_count'].toString());
    }else{
      reviewsCount = 0;
    }
    thumbnailFullUrl = json['thumbnail_full_url'] != null
        ? ImageFullUrl.fromJson(json['thumbnail_full_url'])
        : null;


    clearanceSale = json['clearance_sale'] != null
        ? ClearanceSale.fromJson(json['clearance_sale'])
        : null;
  }

}
