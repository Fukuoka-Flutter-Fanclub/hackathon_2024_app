import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ButtonType {
  primary,
  secondary,
  outline,
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final buttonHeight = height?.h ?? 48.h;
    final borderRadius = BorderRadius.circular(buttonHeight / 2);

    // デフォルトのテキストスタイル
    final defaultTextStyle = theme.textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w600,
      height: 1.5,
      letterSpacing: 0.15,
    );

    ButtonStyle getStyleForType() {
      switch (type) {
        case ButtonType.primary:
          return ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
            textStyle: textStyle ?? defaultTextStyle,
          );

        case ButtonType.secondary:
          return ElevatedButton.styleFrom(
            backgroundColor: colorScheme.secondary,
            foregroundColor: colorScheme.onSecondary,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
            textStyle: textStyle ?? defaultTextStyle,
          ).copyWith(
            overlayColor: WidgetStateProperty.all(
              colorScheme.secondary.withOpacity(0.12),
            ),
          );

        case ButtonType.outline:
          return OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
            side: BorderSide(
              color: colorScheme.primary,
              width: 2.w,
            ),
            textStyle: textStyle ?? defaultTextStyle,
          ).copyWith(
            overlayColor: WidgetStateProperty.all(
              colorScheme.primary.withOpacity(0.12),
            ),
          );
      }
    }

    Widget buildChild() {
      return Text(text);
    }

    Widget button = type == ButtonType.outline
        ? OutlinedButton(
            onPressed: isLoading ? null : onPressed,
            style: getStyleForType(),
            child: buildChild(),
          )
        : ElevatedButton(
            onPressed: isLoading ? null : onPressed,
            style: getStyleForType(),
            child: buildChild(),
          );

    return SizedBox(
      width: width?.w ?? double.infinity,
      height: height?.h ?? 48.h,
      child: button,
    );
  }
}
