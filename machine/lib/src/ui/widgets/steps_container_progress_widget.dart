import 'package:flutter/material.dart';

class StepsContainerProgressWidget extends StatelessWidget {
  final Color stepColor;
  const StepsContainerProgressWidget({super.key, required this.stepColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Container(
          height: 4,
          color: stepColor, // Etapa ativa
        ),
      ),
    );
  }
}
