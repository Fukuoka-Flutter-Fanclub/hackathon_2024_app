import 'package:flutter/material.dart';

enum MyColors {
  // white
  white(color: Color(0xffffffff)),
  // gray
  grayCD(color: Color(0xffCDCDCD)),
  gray300(color: Color(0xffECEDF3)),
  // red
  red(color: Color(0xffff0000)),
  // black
  black(color: Color(0xff080808)), // 半透明等で利用
  black600(color: Color(0xff434343)),
  black900(color: Color(0xff1C1C1C)),
  black1000(color: Color(0xff0C0C0C)),
  // primary
  primaryMain(color: Color(0xff000F9F)),
  // secondary
  secondaryMain(color: Color(0x1A4BADF3)),
  ;

  const MyColors({required this.color});
  final Color color;

  static MaterialColor get materialColor =>
      convertSingleMaterialColor(MyColors.primaryMain.color.value);

  static MaterialColor convertSingleMaterialColor(int value) {
    return MaterialColor(
      value,
      <int, Color>{
        50: Color(value),
        100: Color(value),
        200: Color(value),
        300: Color(value),
        400: Color(value),
        500: Color(value),
        600: Color(value),
        700: Color(value),
        800: Color(value),
        900: Color(value),
      },
    );
  }
}
