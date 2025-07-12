import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learn_machine/src/ui/widgets/simple_text_widget.dart';

class GetStudentApiButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const GetStudentApiButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    const String firstPhrase = 'Get student';
    return SizedBox(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: onPressed,
              icon: SvgPicture.asset('assets/svg/getApiData.svg', width: 60),
            ),
            SimpleTextWidget(
              text: firstPhrase,
              fontSizeText: 15,
              fontWeightText: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
