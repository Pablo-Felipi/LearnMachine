import 'package:flutter/material.dart';
import 'package:learn_machine/src/data/courses_active/courses_active.dart';
import 'package:learn_machine/src/shared/app_shared.dart';
import 'package:learn_machine/src/ui/controller/student_form_controller.dart';
import 'package:learn_machine/src/ui/widgets/simple_text_widget.dart';
import 'package:learn_machine/src/ui/widgets/text_form_field_border_widget.dart';
import 'package:provider/provider.dart';

class CreateFirstStep extends StatefulWidget {
  static const String firstStepRoute = 'First';
  final GlobalKey<FormState> formKey;

  const CreateFirstStep({super.key, required this.formKey});

  @override
  State<CreateFirstStep> createState() => _CreateFirstStepState();
}

class _CreateFirstStepState extends State<CreateFirstStep> {
  final List<String> courses = CoursesActive.courses;
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
            controller: fullNameEc,
            onSaved: (newValue) => formDataController.updateFullName(newValue!),
            decoration: InputDecoration(
              border: TextFormFieldBorderWidget.defaultBorder,
              focusedBorder: TextFormFieldBorderWidget.defaultBorder,
              errorBorder: TextFormFieldBorderWidget.errorBorder,
              isDense: true,
              label: formLabel('Full name'),
            ),
          ),
          TextFormField(
            controller: ageEc,
            onSaved: (newValue) => formDataController.updateAge(newValue ?? ''),
            decoration: InputDecoration(
              border: TextFormFieldBorderWidget.defaultBorder,
              focusedBorder: TextFormFieldBorderWidget.defaultBorder,
              errorBorder: TextFormFieldBorderWidget.errorBorder,
              isDense: true,
              label: formLabel('Age'),
            ),
          ),
          TextFormField(
            controller: phoneEc,
            onChanged: (value) {
              if (value.length == 11) {
                final phoneDDD = value.substring(0, 2);
                final phoneNumber = value.substring(2, 9);
                formDataController.updatePhone(
                  ddd: int.parse(phoneDDD),
                  phoneNumber: phoneNumber,
                );
              }
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
                    label: SimpleTextWidget(text: courseItem),
                    selected: selectedItem.contains(courseItem),
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          selectedItem.add(courseItem);
                          formDataController.updateNameCourses(
                            value: courseItem,
                            delete: false,
                          );
                        } else {
                          selectedItem.remove(courseItem);
                          formDataController.updateNameCourses(
                            value: courseItem,
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
