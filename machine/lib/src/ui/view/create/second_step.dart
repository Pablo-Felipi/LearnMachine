import 'package:flutter/material.dart';
import 'package:learn_machine/src/shared/app_shared.dart';
import 'package:learn_machine/src/ui/controller/student_form_controller.dart';
import 'package:learn_machine/src/ui/widgets/simple_text_widget.dart';
import 'package:learn_machine/src/ui/widgets/text_form_field_border_widget.dart';
import 'package:provider/provider.dart';

class CreateSecondStep extends StatefulWidget {
  static const String secondStepRoute = 'Second';
  final GlobalKey<FormState> formKey;
  const CreateSecondStep({super.key, required this.formKey});

  @override
  State<CreateSecondStep> createState() => _CreateSecondStepState();
}

class _CreateSecondStepState extends State<CreateSecondStep> {
  final zipCodeEc = TextEditingController();
  final streetEC = TextEditingController();
  final streetNumberEc = TextEditingController();
  final cityEc = TextEditingController();
  final cityId = TextEditingController();

  SimpleTextWidget formLabel(String labelString) {
    return SimpleTextWidget(
      text: labelString,
      fontSizeText: 13,
      fontWeightText: FontWeight.normal,
    );
  }

  @override
  Widget build(BuildContext context) {
    final formDataController = Provider.of<StudentFormController>(context);

    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          TextFormField(
            controller: zipCodeEc,
            onChanged: (value) => formDataController.updateZipCode(value),
            decoration: InputDecoration(
              border: TextFormFieldBorderWidget.defaultBorder,
              focusedBorder: TextFormFieldBorderWidget.defaultBorder,
              errorBorder: TextFormFieldBorderWidget.errorBorder,
              isDense: true,
              label: formLabel('Zipcode'),
            ),
          ),
          TextFormField(
            controller: streetEC,
            onChanged: (value) => formDataController.updateStreet(value),
            decoration: InputDecoration(
              border: TextFormFieldBorderWidget.defaultBorder,
              focusedBorder: TextFormFieldBorderWidget.defaultBorder,
              errorBorder: TextFormFieldBorderWidget.errorBorder,
              isDense: true,
              label: formLabel('Street'),
            ),
          ),
          TextFormField(
            controller: streetNumberEc,
            onChanged: (value) => formDataController.updateStreetNumber(value),
            decoration: InputDecoration(
              border: TextFormFieldBorderWidget.defaultBorder,
              focusedBorder: TextFormFieldBorderWidget.defaultBorder,
              errorBorder: TextFormFieldBorderWidget.errorBorder,
              isDense: true,
              label: formLabel('Street Number'),
            ),
          ),
          TextFormField(
            controller: cityEc,
            onChanged:
                (value) =>
                    formDataController.updateCity(idCity: 1, cityName: value),
            decoration: InputDecoration(
              border: TextFormFieldBorderWidget.defaultBorder,
              focusedBorder: TextFormFieldBorderWidget.defaultBorder,
              errorBorder: TextFormFieldBorderWidget.errorBorder,
              isDense: true,
              label: formLabel('City'),
            ),
          ),
          Divider(color: AppShared.defaultGreyColor),
        ],
      ),
    );
  }
}
