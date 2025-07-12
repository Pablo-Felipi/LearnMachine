import 'package:flutter/material.dart';
import 'package:learn_machine/src/shared/app_shared.dart';

class CenterCircularProgressIndicatorWidget extends StatelessWidget {
  const CenterCircularProgressIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: AppShared.defaultBlueColor),
    );
  }
}
