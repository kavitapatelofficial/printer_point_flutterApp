import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/common/basewidget/custom_app_bar_widget.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:html_unescape/html_unescape_small.dart';
// import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:url_launcher/url_launcher.dart';

class SpecificationScreen extends StatelessWidget {
  final String specification;
  const SpecificationScreen({super.key, required this.specification});

  @override
  Widget build(BuildContext context) {
    String cleanedHtml = HtmlUnescape().convert(specification
        .replaceAll(r'\\r\\n', '')
        .replaceAll(r'\r\n', '')
        .replaceAll(r'\\n', '')
        .replaceAll(r'\n', '')
        .replaceAll(r'\\r', '')
        .replaceAll(r'\r', '')
        .replaceAll(r'\\', '')
        .replaceAll(r'\"', '"'));

    return Scaffold(
      appBar: CustomAppBar(title: getTranslated('specification', context)),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeDefault),
        child: Column(children: [
          Expanded(
              child: SingleChildScrollView(
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
          )),
          const SizedBox(height: Dimensions.paddingSizeSmall),
        ]),
      ),
    );
  }
}
