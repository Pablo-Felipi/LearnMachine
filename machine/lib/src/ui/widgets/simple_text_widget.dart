import 'package:flutter/material.dart';

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
        fontFamily: 'Montserrat',
        fontWeight: fontWeightText,
        fontSize: fontSizeText ?? 12,
        color: colorText ?? Colors.black,
      ),
    );
  }
}
