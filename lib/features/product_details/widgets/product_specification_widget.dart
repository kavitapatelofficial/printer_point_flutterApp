import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/features/product_details/screens/specification_screen.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/theme/controllers/theme_controller.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
// import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductSpecificationWidget extends StatelessWidget {
  final String productSpecification;

  const ProductSpecificationWidget(
      {super.key, required this.productSpecification});

  @override
  Widget build(BuildContext context) {
    print("==== productSpecification===${productSpecification}==========");
    String cleanedHtml = productSpecification
        .replaceAll(r'\r\n', '')
        .replaceAll(r'\n', '')
        .replaceAll(r'\r', '')
        .replaceAll(r'\\n', '')
        .replaceAll(r'\\r', '');

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslated('product_specification', context) ?? '',
          style: textMedium,
        ),
        const SizedBox(
            height:
                8.0), // Replace with Dimensions.paddingSizeExtraSmall if needed

        Column(children: [
          Stack(children: [
            Container(
              height: (productSpecification.isNotEmpty &&
                      productSpecification.length > 400)
                  ? 150
                  : null,
              padding: const EdgeInsets.all(12.0).copyWith(
                  bottom: 0), // Replace with Dimensions.paddingSizeSmall
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Html(
                  data: cleanedHtml,
                  onLinkTap: (url, context, attributes) {
                    print("====url=======$url========");
                    if (url != null) {
                      print("====url=======$url========");
                      launchUrl(Uri.parse(url),
                          mode: LaunchMode.externalApplication);
                    }
                  },
                ),
              ),
            ),
            if (productSpecification.isNotEmpty &&
                productSpecification.length > 400)
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Theme.of(context).cardColor.withOpacity(0),
                          Theme.of(context).cardColor,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ]),
          if (productSpecification.isNotEmpty &&
              productSpecification.length > 400)
            Center(
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SpecificationScreen(
                        specification: productSpecification),
                  ),
                ),
                child: Text(
                  getTranslated('view_full_detail', context)!,
                  style: titleRegular.copyWith(
                    color: Provider.of<ThemeController>(context, listen: false)
                            .darkTheme
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
        ]),
      ],
    );
  }
}
