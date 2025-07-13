import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/formatter_utils.dart';
import 'package:machine/src/domain/models/active_courses/active_courses_model.dart';
import 'package:machine/src/shared/app_shared.dart';
import 'package:machine/src/shared/text_formatter_shared.dart';
import 'package:machine/src/ui/controller/active_courses_controller.dart';
import 'package:machine/src/ui/controller/student_form_controller.dart';
import 'package:machine/src/ui/validations/form_validator.dart';
import 'package:machine/src/ui/widgets/simple_text_widget.dart';
import 'package:machine/src/ui/widgets/text_form_field_border_widget.dart';
import 'package:provider/provider.dart';

class CreateFirstStep extends StatefulWidget {
  static const String firstStepRoute = 'First';
  final GlobalKey<FormState> formKey;

  const CreateFirstStep({super.key, required this.formKey});

  @override
  State<CreateFirstStep> createState() => _CreateFirstStepState();
}

class _CreateFirstStepState extends State<CreateFirstStep> {
  final List<String> selectedItem = [];

  SimpleTextWidget formLabel(String labelString) {
    return SimpleTextWidget(
      text: labelString,
      fontSizeText: 13,
      fontWeightText: FontWeight.normal,
    );
  }

  final fullNameEc = TextEditingController();
  final ageEc = TextEditingController();
  final phoneEc = TextEditingController();
  final validator = FormValidator();

  @override
  void dispose() {
    fullNameEc.dispose();
    ageEc.dispose();
    phoneEc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formDataController = Provider.of<StudentFormController>(context);
    final activeCoursesController = Provider.of<ActiveCoursesController>(
      context,
    );
    final List<ActiveCoursesModel> courses = activeCoursesController.state;
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: fullNameEc,
            validator: validator.fullName,
            onSaved: (value) => formDataController.updateFullName(value!),
            decoration: InputDecoration(
              border: TextFormFieldBorderWidget.defaultBorder,
              focusedBorder: TextFormFieldBorderWidget.defaultBorder,
              errorBorder: TextFormFieldBorderWidget.errorBorder,
              isDense: true,
              label: formLabel('Full name'),
            ),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: ageEc,
            validator: validator.age,
            keyboardType: TextInputType.number,
            inputFormatters: TextFormatterShared.ageFormatter,
            onSaved: (value) => formDataController.updateAge(value!),
            decoration: InputDecoration(
              border: TextFormFieldBorderWidget.defaultBorder,
              focusedBorder: TextFormFieldBorderWidget.defaultBorder,
              errorBorder: TextFormFieldBorderWidget.errorBorder,
              isDense: true,
              label: formLabel('Age'),
            ),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: phoneEc,
            validator: validator.phone,
            keyboardType: TextInputType.number,
            inputFormatters: TextFormatterShared.phoneFormatter,
            onSaved: (value) {
              final phoneWithOutMask = toNumericString(value);
              final phoneDDD = phoneWithOutMask.substring(0, 2);
              final phoneNumber = phoneWithOutMask.substring(2, 11);
              formDataController.updatePhone(
                ddd: int.parse(phoneDDD),
                phoneNumber: phoneNumber,
              );
            },
            decoration: InputDecoration(
              border: TextFormFieldBorderWidget.defaultBorder,
              focusedBorder: TextFormFieldBorderWidget.defaultBorder,
              errorBorder: TextFormFieldBorderWidget.errorBorder,
              isDense: true,
              label: formLabel('Phone'),
            ),
          ),
          Divider(color: AppShared.defaultGreyColor),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SimpleTextWidget(
                text: 'select the desired courses',
                fontWeightText: FontWeight.bold,
                fontSizeText: 14,
              ),
              SimpleTextWidget(
                text: 'This will help us personalise your experience',
                fontWeightText: FontWeight.w500,
                fontSizeText: 12,
              ),
            ],
          ),

          Wrap(
            spacing: 4,
            children:
                courses.map((courseItem) {
                  return FilterChip(
                    selectedColor: AppShared.defaultBlueColor,
                    backgroundColor: Colors.white,
                    label: SimpleTextWidget(text: courseItem.name),
                    selected: selectedItem.contains(courseItem.name),
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          selectedItem.add(courseItem.name);
                          formDataController.updateNameCourses(
                            value: courseItem.name,
                            delete: false,
                          );
                        } else {
                          selectedItem.remove(courseItem.name);
                          formDataController.updateNameCourses(
                            value: courseItem.name,
                            delete: true,
                          );
                        }
                      });
                    },
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
