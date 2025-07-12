import 'package:flutter/material.dart';
import 'package:learn_machine/src/ui/widgets/simple_text_widget.dart';

class CenterTextIsErrorWidget extends StatelessWidget {
  final String text;
  const CenterTextIsErrorWidget ({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SimpleTextWidget(
        text: text,
        fontSizeText: 16,
        fontWeightText: FontWeight.w500,
      ),
    );
  }
}
