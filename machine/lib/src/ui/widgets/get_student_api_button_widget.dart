import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:machine/src/ui/widgets/simple_text_widget.dart';

class GetStudentApiButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String getApiSvg = 'assets/svg/getApiData.svg';
  final String firstPhrase = 'Get student';
  const GetStudentApiButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: onPressed,
              icon: SvgPicture.asset(getApiSvg, width: 60),
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
