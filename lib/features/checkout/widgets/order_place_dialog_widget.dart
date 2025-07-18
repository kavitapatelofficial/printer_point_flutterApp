import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/common/basewidget/custom_button_widget.dart';

class OrderPlaceDialogWidget extends StatelessWidget {
  final bool isFailed;
  final double rotateAngle;
  final IconData icon;
  final dynamic title;
  final dynamic description;
  const OrderPlaceDialogWidget({super.key, this.isFailed = false, this.rotateAngle = 0, required this.icon, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(padding: const EdgeInsets.symmetric(vertical : Dimensions.paddingSizeLarge),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
            child: SizedBox(width: 60,child: Image.asset(Images.orderPlaceIcon)),),
          Text(title!, style: robotoBold.copyWith(fontSize: Dimensions.fontSizeLarge), maxLines: 2, textAlign: TextAlign.center),
          const SizedBox(height: Dimensions.paddingSizeSmall),
          Text(description!, textAlign: TextAlign.center, style: titilliumRegular),
          const SizedBox(height: Dimensions.paddingSizeExtraLarge),
          SizedBox(height: 35, width: 90, child: CustomButton(
            radius: 5, buttonText: getTranslated('ok', context), onTap: () => Navigator.pop(context))),
        ]),
      ),
    );
  }
}
