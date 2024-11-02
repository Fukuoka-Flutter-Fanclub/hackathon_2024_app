import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// textThemeは、contextのextensionに組み入れている
// 例: style:context.titleL

// またOriginalTextThemeも面倒なのでThemeExtensionなど使わず、そのままcontextのextensionに組み入れている
// ignore: avoid_classes_with_only_static_members
class OriginalTextTheme {
  // textLink
  static final textLinkStyle1 = TextStyle(
    decoration: TextDecoration.underline,
    fontSize: 17.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.11999999731779099,
    height: 28 / 17,
  );
  static final textLinkStyle2 = TextStyle(
    decoration: TextDecoration.underline,
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.09000000357627869,
    height: 24 / 15,
  );
  static final TextStyle textLinkStyle3 = TextStyle(
    decoration: TextDecoration.underline,
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.05999999865889549,
    height: 20 / 13,
  );
}

final themeProvider = Provider<ThemeData>((ref) {
  final textTheme = TextTheme(
    // headline
    headlineLarge: TextStyle(
      fontSize: 31.sp,
      fontWeight: FontWeight.w100,
      letterSpacing: 0.33,
      height: 56 / 31,
    ),
    headlineMedium: TextStyle(
      fontSize: 27.sp,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.27.sp,
      height: 48 / 27,
    ),
    headlineSmall: TextStyle(
      fontSize: 23.sp,
      fontWeight: FontWeight.w100,
      letterSpacing: 0.21.sp,
      height: 40 / 23,
    ),

    // title
    titleLarge: TextStyle(
      fontSize: 21.sp,
      fontWeight: FontWeight.w300,
      letterSpacing: 0.18.sp,
      height: 36 / 21,
    ),
    titleMedium: TextStyle(
      fontSize: 17.sp,
      fontWeight: FontWeight.w700,
      letterSpacing: 17.sp * 0.0012,
      height: 28 / 17,
    ),
    titleSmall: TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.w300,
      letterSpacing: 0.09.sp,
      height: 24 / 15,
    ),

    // label
    labelLarge: TextStyle(
      fontSize: 17.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.12.sp,
      height: 28 / 17,
    ),
    labelMedium: TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.09.sp,
      height: 24 / 15,
    ),
    labelSmall: TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.06.sp,
      height: 20 / 13,
    ),

    // body
    bodyLarge: TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.w300,
      letterSpacing: 0.09000000357627869.sp,
      height: 24 / 15,
    ),
    bodyMedium: TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeight.w300,
      letterSpacing: 0.05999999865889549.sp,
      height: 20 / 13,
    ),
    bodySmall: TextStyle(
      fontSize: 11.sp,
      fontWeight: FontWeight.w300,
      letterSpacing: 0.029999999329447746.sp,
      height: 16 / 11,
    ),
  );
  return ThemeData(
    useMaterial3: false,
    fontFamily: 'NotoSansJP',
    textTheme: textTheme,
  );
});
