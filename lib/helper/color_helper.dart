import 'dart:ui';

class ColorHelper {
  static Color? hexCodeToColor(dynamic code){
    dynamic colorCode = int.tryParse(code?.replaceAll('#', '0xff') ?? '');

    return colorCode == null ? null : Color(colorCode);
  }
}