import 'package:flutter/material.dart';

enum MyColors {
  // nemo
  nemo00(color: Color(0xffE9BE9F)),
  // white
  white(color: Color(0xffffffff)),
  // gray
  grayCD(color: Color(0xffCDCDCD)),
  gray300(color: Color(0xffECEDF3)),
  // black
  black(color: Color(0xff080808)), // 半透明等で利用
  black600(color: Color(0xff434343)),
  black900(color: Color(0xff1C1C1C)),
  black1000(color: Color(0xff0C0C0C)),
  // primary
  primaryMain(color: Color(0xff000F9F)),
  primaryDark(color: Color(0xffCCC8BC)),
  primaryGradientStart(color: Color(0xffDCB879)),
  primaryGradientEnd(color: Color(0xffBA9132)),
  // Secondary
  secondaryMain(color: Color(0xffCCC8BC)),
  secondaryLight(color: Color(0xffE8E7E4)),
  secondaryDark(color: Color(0xff787878)),
  // Button
  primaryButton(color: Color(0x40DCB879)),
  dangerButton(color: Color(0x26CC543A)),
  secondaryButton(color: Color(0x26CCC8BC)),
  successButton(color: Color(0x34C75926)), // TODO(Minato): 未利用
  // Bg
  bgIconLight(color: Color(0x26CCC8BC)),
  bgIconDark(color: Color(0x800C0C0C)),
  bgBottomAndTopBar(color: Color(0x800C0C0C)),
  bgSheetWhite(color: Color(0xCCE8E7E4)),
  bgSheetBlack(color: Color(0xCC0C0C0C)),
  bgPullDown(color: Color(0x26CCC8BC)),
  bgSticky(color: Color(0x401C1C1C)),
  bgBlackLayer(color: Color(0x0D1C1C1C)), // TODO(Minato): 未利用
  bgImageBlur(color: Color(0x3D000000)),
  // Grad
  // TODO(Minato): 未作成のため追加予定
  // State
  stateDanger(color: Color(0xffFD3B2A)),
  stateWarning(color: Color(0xffF9CC2D)),
  stateSuccess(color: Color(0xff34C759)),
  // Flow
  // TODO(Minato): 未作成のため追加予定
  // Other
  otherLink(color: Color(0xff7DB9DE)),
  // Others
  opacity(color: Color(0x00000000)),
  timeFuture(color: Color(0xffD7B98E)),
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
