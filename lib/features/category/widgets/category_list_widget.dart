import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/common/basewidget/custom_image_widget.dart';
import 'package:flutter_sixvalley_ecommerce/common/basewidget/title_row_widget.dart';
import 'package:flutter_sixvalley_ecommerce/features/category/controllers/category_controller.dart';
import 'package:flutter_sixvalley_ecommerce/features/category/screens/category_screen.dart';
import 'package:flutter_sixvalley_ecommerce/features/product/screens/brand_and_category_product_screen.dart';
import 'package:flutter_sixvalley_ecommerce/localization/controllers/localization_controller.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:provider/provider.dart';

import '../domain/models/category_model.dart';
import 'category_shimmer_widget.dart';

class CategoryListWidget extends StatelessWidget {
  final bool isHomePage;

  const CategoryListWidget({super.key, required this.isHomePage});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryController>(
      builder: (context, categoryProvider, child) {
        final isLtr =
            Provider.of<LocalizationController>(context, listen: false).isLtr;

        return Padding(
            padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeExtraExtraSmall,vertical: 0),
          child: Column(
            children: [
              TitleRowWidget(
                title: getTranslated('CATEGORY', context),
                onTap: () {
                  if (categoryProvider.categoryList.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CategoryScreen(),
                      ),
                    );
                  }
                },
              ),
              // const SizedBox(height: Dimensions.paddingSizeSmall),
              categoryProvider.categoryList.isNotEmpty && isLtr
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                  horizontal:16,vertical: 0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: categoryProvider.categoryList.length > 9
                          ? 9
                          : categoryProvider.categoryList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.93,
                      ),
                      itemBuilder: (context, index) {
                        final category = categoryProvider.categoryList[index];
                        return InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BrandAndCategoryProductScreen(
                                  isBrand: false,
                                  id: category.id,
                                  name: category.name,
                                ),
                              ),
                            );
                          },
                          child: CategoryWidget(
                            category: category,
                            index: index,
                            length: categoryProvider.categoryList.length,
                          ),
                        );
                      },
                    ),
                  )
                  : const CategoryShimmerWidget(),
            ],
          ),
        );
      },
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final CategoryModel category;
  final int index;
  final int length;

  const CategoryWidget({
    Key? key,
    required this.category,
    required this.index,
    required this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Container(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 3),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.333 - 10,
        minHeight: 100,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFF8F8FF), // Assuming --ghost-white (you can adjust)
        border: Border.all(
          color: Color(0xFFE5E4E2), // Assuming --platinum (adjust as needed)
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: MediaQuery.of(context).size.width / 4.5,
              width: MediaQuery.of(context).size.width / 4.5,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).primaryColor.withOpacity(.125),
                      width: .25),
                  borderRadius:
                      BorderRadius.circular(Dimensions.paddingSizeSmall),
                  color: Theme.of(context).primaryColor.withOpacity(.125)),
              child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(Dimensions.paddingSizeSmall),
                  child: CustomImageWidget(
                      image: '${category.imageFullUrl!.key}'))),
          const SizedBox(height: Dimensions.paddingSizeExtraSmall),
          Center(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width ,
                  child: Text(category.name ?? '',
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textRegular.copyWith(
                          fontSize:9,
                          color: ColorResources.getTextTitle(context)))))
        ],
      ),
    );
  }
}
