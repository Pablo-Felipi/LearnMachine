import 'package:flutter/material.dart';
import 'package:machine/src/shared/app_shared.dart';

class SimpleTextWidget extends StatelessWidget {
  final String text;
  final FontWeight? fontWeightText;
  final double? fontSizeText;
  final Color? colorText;

  const SimpleTextWidget({
    super.key,
    required this.text,
    this.fontWeightText,
    this.fontSizeText,
    this.colorText,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: AppShared.defaultFontFamily,
        fontWeight: fontWeightText,
        fontSize: fontSizeText ?? 12,
        color: colorText ?? Colors.black,
      ),
    );
  }
}
