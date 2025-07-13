import 'package:flutter/material.dart';
import 'package:machine/src/shared/app_shared.dart';
import 'package:machine/src/shared/text_formatter_shared.dart';
import 'package:machine/src/ui/controller/adress_from_zicode_controller.dart';
import 'package:machine/src/ui/controller/student_form_controller.dart';
import 'package:machine/src/ui/validations/form_validator.dart';
import 'package:machine/src/ui/widgets/simple_text_widget.dart';
import 'package:machine/src/ui/widgets/text_form_field_border_widget.dart';
import 'package:provider/provider.dart';

class CreateSecondStep extends StatefulWidget {
  static const String secondStepRoute = 'Second';
  final GlobalKey<FormState> formKey;
  const CreateSecondStep({super.key, required this.formKey});

  @override
  State<CreateSecondStep> createState() => _CreateSecondStepState();
}

class _CreateSecondStepState extends State<CreateSecondStep> {
  final validator = FormValidator();
  final zipCodeEc = TextEditingController();
  final streetEC = TextEditingController();
  final streetNumberEc = TextEditingController();
  final cityEc = TextEditingController();
  final cityId = TextEditingController();

  @override
  void dispose() {
    zipCodeEc.dispose();
    streetEC.dispose();
    streetNumberEc.dispose();
    cityEc.dispose();
    cityId.dispose();
    super.dispose();
  }

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
    final adressFromZipCodeController =
        Provider.of<AddressFromZicodeController>(context);

    void searchAddress(String cep) async {
      await adressFromZipCodeController.getAddress(cep: cep);
      final address = adressFromZipCodeController.state;
      streetEC.text = address.logradouro;
      cityEc.text = address.localidade;
      cityId.text = address.ibge;
    }

    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: zipCodeEc,
            validator: validator.zipCode,
            inputFormatters: TextFormatterShared.zipCodeFormatter,
            onSaved: (value) => formDataController.updateZipCode(value!),
            decoration: InputDecoration(
              suffixIcon: TextButton.icon(
                onPressed: () => searchAddress(zipCodeEc.text),
                label: SimpleTextWidget(text: 'Search Address'),
                icon: Icon(Icons.search),
                iconAlignment: IconAlignment.end,
              ),
              border: TextFormFieldBorderWidget.defaultBorder,
              focusedBorder: TextFormFieldBorderWidget.defaultBorder,
              errorBorder: TextFormFieldBorderWidget.errorBorder,
              isDense: true,
              label: formLabel('Zipcode'),
            ),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: streetEC,
            validator: validator.streetName,
            onSaved: (value) => formDataController.updateStreet(value!),
            decoration: InputDecoration(
              border: TextFormFieldBorderWidget.defaultBorder,
              focusedBorder: TextFormFieldBorderWidget.defaultBorder,
              errorBorder: TextFormFieldBorderWidget.errorBorder,
              isDense: true,
              label: formLabel('Street'),
            ),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: cityEc,
            validator: validator.cityName,
            onSaved: (value) {
              formDataController.updateCity(
                idCity: int.parse(cityId.text),
                cityName: value!,
              );
            },
            decoration: InputDecoration(
              suffix: SimpleTextWidget(text: cityId.text),
              border: TextFormFieldBorderWidget.defaultBorder,
              focusedBorder: TextFormFieldBorderWidget.defaultBorder,
              errorBorder: TextFormFieldBorderWidget.errorBorder,
              isDense: true,
              label: formLabel('City'),
            ),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: streetNumberEc,
            validator: validator.streetNumber,
            inputFormatters: TextFormatterShared.streetNumberFormatter,
            onSaved: (value) => formDataController.updateStreetNumber(value!),
            decoration: InputDecoration(
              border: TextFormFieldBorderWidget.defaultBorder,
              focusedBorder: TextFormFieldBorderWidget.defaultBorder,
              errorBorder: TextFormFieldBorderWidget.errorBorder,
              isDense: true,
              label: formLabel('Street Number'),
            ),
          ),
          Divider(color: AppShared.defaultGreyColor),
        ],
      ),
    );
  }
}
