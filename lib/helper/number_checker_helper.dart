import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/foundation.dart';

class NumberCheckerHelper {

  static bool isNumber(String number) {
    return number.split('').every((digit) => '+0123456789'.contains(digit));

    // if (number.startsWith('+')) {
    //   // After the '+', check if the remaining characters are digits
    //   return number.length > 1 && number.substring(1).split('').every((digit) => '0123456789'.contains(digit));
    // } else {
    //   // If no '+', check if all characters are digits
    //   return number.split('').every((digit) => '0123456789'.contains(digit));
    // }

  }

  static dynamic getCountryCode(dynamic number) {
    dynamic countryCode = '';
    try{
      countryCode = codes.firstWhere((item) =>
          number!.contains('${item['dial_code']}'))['dial_code'];
    }catch(error){
      debugPrint('country error: $error');
    }
    return countryCode;
  }

  static dynamic getPhoneNumber(String phoneNumberWithCountryCode, String countryCode){
    String phoneNumber = phoneNumberWithCountryCode.split(countryCode).last;
    return phoneNumber;
  }

}