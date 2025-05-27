import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/features/banner/controllers/banner_controller.dart';
import 'package:flutter_sixvalley_ecommerce/features/banner/widgets/banner_shimmer.dart';
import 'package:flutter_sixvalley_ecommerce/theme/controllers/theme_controller.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/common/basewidget/custom_image_widget.dart';
import 'package:provider/provider.dart';

class BannersWidget extends StatelessWidget {
  const BannersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Consumer<BannerController>(
          builder: (context, bannerProvider, child) {
            return bannerProvider.mainBannerList != null
                ? bannerProvider.mainBannerList!.isNotEmpty
                    ? SizedBox(
                        height: width * 0.42,
                        width: width,
                        child: Stack(
                          children: [
                            CarouselSlider.builder(
                              options: CarouselOptions(
                                height: width * 0.42,
                                viewportFraction: 1.0,
                                autoPlay: true,
                                onPageChanged: (index, reason) {
                                  Provider.of<BannerController>(context,
                                          listen: false)
                                      .setCurrentIndex(index);
                                },
                              ),
                              itemCount:
                                  bannerProvider.mainBannerList!.length,
                              itemBuilder: (context, index, _) {
                                final banner =
                                    bannerProvider.mainBannerList![index];
                                return InkWell(
                                  onTap: () {
                                    if (banner.resourceId != null) {
                                      bannerProvider.clickBannerRedirect(
                                        context,
                                        banner.resourceId,
                                        banner.resourceType == 'product'
                                            ? banner.product
                                            : null,
                                        banner.resourceType,
                                      );
                                    }
                                  },
                                  child: Container(
                                    color: Provider.of<ThemeController>(
                                                context,
                                                listen: false)
                                            .darkTheme
                                        ? Theme.of(context)
                                            .primaryColor
                                            .withOpacity(.1)
                                        : Theme.of(context)
                                            .primaryColor
                                            .withOpacity(.05),
                                    child: CustomImageWidget(
                                      image:
                                          '${banner.photoFullUrl?.path ?? ''}',
                                      fit: BoxFit.cover,
                                      width: width,
                                    ),
                                  ),
                                );
                              },
                            ),

                            // Indicator dots / pill-style indicator
                            Positioned(
                              bottom: 10,
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  bannerProvider.mainBannerList!.length,
                                  (index) => AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    padding: bannerProvider.currentIndex == index
                                        ? const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 3)
                                        : const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      color: bannerProvider.currentIndex == index
                                          ? Theme.of(context).primaryColor
                                          : Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: bannerProvider.currentIndex == index
                                        ? Text(
                                            "${index + 1}/${bannerProvider.mainBannerList!.length}",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          )
                                        : const SizedBox(width: 7, height: 7),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox()
                : const BannerShimmer();
          },
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
