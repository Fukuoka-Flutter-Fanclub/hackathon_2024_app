import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ButtonType {
  primary,
  secondary,
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.type,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.width,
    this.height,
    this.textStyle,
  });

  final ButtonType type;
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? width;
  final double? height;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    // デフォルトのテキストスタイル
    final defaultTextStyle = Theme.of(context).textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w500,
          color: Colors.white,
        );

    // ボタンのベーススタイル
    final baseStyle = Theme.of(context).elevatedButtonTheme.style?.copyWith(
          textStyle: WidgetStateProperty.all(
            textStyle ?? defaultTextStyle,
          ),
        );

    // ボタンタイプに応じたスタイル
    ButtonStyle? getStyleForType() {
      switch (type) {
        case ButtonType.primary:
          return baseStyle;
        case ButtonType.secondary:
          // セカンダリーボタンのスタイルをここに追加
          return baseStyle?.copyWith(
              // セカンダリー用のスタイル設定
              );
      }
    }

    return SizedBox(
      width: width?.w ?? double.infinity,
      height: height?.h ?? 48.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: getStyleForType(),
        child: Text(text),
      ),
    );
  }
}
