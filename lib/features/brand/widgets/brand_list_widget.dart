import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/common/basewidget/paginated_list_view_widget.dart';
import 'package:flutter_sixvalley_ecommerce/features/brand/controllers/brand_controller.dart';
import 'package:flutter_sixvalley_ecommerce/features/brand/widgets/brand_shimmer_widget.dart';
import 'package:flutter_sixvalley_ecommerce/features/product/screens/brand_and_category_product_screen.dart';
import 'package:flutter_sixvalley_ecommerce/helper/responsive_helper.dart';
import 'package:flutter_sixvalley_ecommerce/localization/controllers/localization_controller.dart';
import 'package:flutter_sixvalley_ecommerce/theme/controllers/theme_controller.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/common/basewidget/custom_image_widget.dart';
import 'package:provider/provider.dart';

class BrandListWidget extends StatefulWidget {
  final bool isHomePage;
  const BrandListWidget({super.key, required this.isHomePage});

  @override
  State<BrandListWidget> createState() => _BrandListWidgetState();
}

class _BrandListWidgetState extends State<BrandListWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Consumer<BrandController>(
      builder: (context, brandProvider, child) {
        return brandProvider.brandList.isNotEmpty
            ? widget.isHomePage
                ? SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: brandProvider.brandList
                            .map((brand) => InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                BrandAndCategoryProductScreen(
                                                    isBrand: true,
                                                    id: brand.id,
                                                    name: brand.name,
                                                    image: brand.imageFullUrl
                                                                ?.status ==
                                                            200
                                                        ? brand
                                                            .imageFullUrl?.path
                                                        : brand.imageFullUrl
                                                            ?.key!)));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(4),
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 5, 5, 3),
                                    constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.of(context).size.width *
                                                  0.333 -
                                              10,
                                      minHeight: 100,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(
                                          0xFFF8F8FF), // Assuming --ghost-white (you can adjust)
                                      border: Border.all(
                                        color: const Color(
                                            0xFFE5E4E2), // Assuming --platinum (adjust as needed)
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width:
                                              ResponsiveHelper.isTab(context)
                                                  ? 120
                                                  : 80,
                                          height:
                                              ResponsiveHelper.isTab(context)
                                                  ? 120
                                                  : 80,
                                          decoration: BoxDecoration(
                                            color: const Color(
                                                0xFFF8F8FF), // Assuming --ghost-white (you can adjust)
                                            border: Border.all(
                                              color: const Color(
                                                  0xFFE5E4E2), // Assuming --platinum (adjust as needed)
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(5)),
                                              child: CustomImageWidget(
                                                  image:
                                                      '${brand.imageFullUrl?.status == 200 ? brand.imageFullUrl?.path : brand.imageFullUrl?.key!}')),
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
                            .toList()))
                : SingleChildScrollView(
                    controller: _scrollController,
                    child: PaginatedListView(
                        scrollController: _scrollController,
                        totalSize: brandProvider.brandModel?.totalSize,
                        offset: brandProvider.brandModel?.offset,
                        onPaginate: (dynamic offset) async {
                          await brandProvider.getBrandList(false,
                              offset: offset!);
                        },
                        itemView: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: (1 / 0.98),
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 15),
                          padding: EdgeInsets.zero,
                          itemCount: brandProvider.brandList.length,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            BrandAndCategoryProductScreen(
                                                isBrand: true,
                                                id: brandProvider
                                                    .brandList[index].id,
                                                name: brandProvider
                                                    .brandList[index].name,
                                                image: brandProvider
                                                            .brandList[index]
                                                            .imageFullUrl
                                                            ?.status ==
                                                        200
                                                    ? brandProvider
                                                        .brandList[index]
                                                        .imageFullUrl
                                                        ?.path
                                                    : brandProvider
                                                        .brandList[index]
                                                        .imageFullUrl
                                                        ?.key)));
                              },
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 3),
                                constraints: BoxConstraints(
                                  maxWidth: MediaQuery.of(context).size.width *
                                          0.333 -
                                      10,
                                  minHeight: 100,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(
                                      0xFFF8F8FF), // Assuming --ghost-white (you can adjust)
                                  border: Border.all(
                                    color: const Color(
                                        0xFFE5E4E2), // Assuming --platinum (adjust as needed)
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                        child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(
                                            0xFFF8F8FF), // Assuming --ghost-white (you can adjust)
                                        border: Border.all(
                                          color: const Color(
                                              0xFFE5E4E2), // Assuming --platinum (adjust as needed)
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: CustomImageWidget(
                                          image:
                                              '${brandProvider.brandList[index].imageFullUrl?.status == 200 ? brandProvider.brandList[index].imageFullUrl?.path : brandProvider.brandList[index].imageFullUrl?.key}'),
                                    )),
                                    SizedBox(
                                        height:
                                            (MediaQuery.of(context).size.width /
                                                    4) *
                                                0.3,
                                        child: Center(
                                            child: Text(
                                                brandProvider
                                                    .brandList[index].name!,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: textRegular.copyWith(
                                                    fontSize: Dimensions
                                                        .fontSizeSmall)))),
                                  ],
                                ),
                              ),
                            );
                          },
                        )),
                  )
            : BrandShimmerWidget(isHomePage: widget.isHomePage);
      },
    );
  }
}
