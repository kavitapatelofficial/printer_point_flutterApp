import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/localization/app_localization.dart';

dynamic getTranslated(dynamic key, BuildContext context) {
  dynamic text = key;
  try{
    text = AppLocalization.of(context)!.translate(key);
  }catch (error){
    text = "$key";
  }
  return text;
}