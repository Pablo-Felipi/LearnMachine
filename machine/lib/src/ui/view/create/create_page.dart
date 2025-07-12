import 'package:flutter/material.dart';
import 'package:learn_machine/src/shared/app_shared.dart';
import 'package:learn_machine/src/ui/controller/create_page_controller.dart';
import 'package:learn_machine/src/ui/controller/student_form_controller.dart';
import 'package:learn_machine/src/ui/controller/students_controller.dart';
import 'package:learn_machine/src/ui/view/create/first_step.dart';
import 'package:learn_machine/src/ui/view/create/second_step.dart';
import 'package:learn_machine/src/ui/widgets/app_bar_widget.dart';
import 'package:learn_machine/src/ui/widgets/simple_text_widget.dart';
import 'package:learn_machine/src/ui/widgets/steps_container_progress_widget.dart';
import 'package:provider/provider.dart';

class CreatePage extends StatefulWidget {
  static const createRoute = '/create';
  const CreatePage({super.key});
  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final String _firstTopPhrase = 'Create new student';
  final String _secondTopPhrase =
      'Thank you for joining our platform.Lets set up your profile. this will help in team to identify and mention you';
  String _mainButtonText = 'Continue';
  final firstStepFormKey = GlobalKey<FormState>();
  final secondStepFormKey = GlobalKey<FormState>();

  Widget buildStep({required StepForm steps}) {
    switch (steps) {
      case StepForm.firstStep:
        return CreateFirstStep(formKey: firstStepFormKey);
      case StepForm.secondStep:
        return CreateSecondStep(formKey: secondStepFormKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final createController = Provider.of<CreatePageController>(context);
    final studentsController = Provider.of<StudentsController>(context);
    final studentFormController = Provider.of<StudentFormController>(context);

    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SimpleTextWidget(
                  text: _firstTopPhrase,
                  fontSizeText: 16,
                  fontWeightText: FontWeight.bold,
                ),
                SimpleTextWidget(
                  text: _secondTopPhrase,
                  fontSizeText: 12,
                  fontWeightText: FontWeight.w500,
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    StepsContainerProgressWidget(
                      stepColor: AppShared.defaultBlueColor,
                    ),
                    StepsContainerProgressWidget(
                      stepColor: AppShared.defaultGreyColor,
                    ),
                    StepsContainerProgressWidget(
                      stepColor: AppShared.defaultGreyColor,
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Stack(
                  children: [
                    buildStep(
                      steps:
                          createController.getSteps()[createController
                              .currentStep],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: screenWidth,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppShared.defaultGreyColor,
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor: WidgetStatePropertyAll(
                        AppShared.defaultGreyColor,
                      ),
                      backgroundColor: WidgetStatePropertyAll(
                        AppShared.defaultGreyColor,
                      ),
                    ),
                    onPressed: () {
                      createController.nextStep(
                        studentController: studentsController,
                        studentFormController: studentFormController,
                      );

                      createController.currentStep == 1
                          ? _mainButtonText = 'Send'
                          : _mainButtonText;
                    },
                    child: SimpleTextWidget(
                      text: _mainButtonText,
                      fontSizeText: 14,
                      fontWeightText: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
