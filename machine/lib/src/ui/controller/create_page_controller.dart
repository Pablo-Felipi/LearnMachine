import 'package:flutter/material.dart';
import 'package:machine/src/domain/models/student/student_model.dart';
import 'package:machine/src/ui/controller/student_form_controller.dart';
import 'package:machine/src/ui/controller/students_controller.dart';

enum StepForm { firstStep, secondStep }

class CreatePageController extends ChangeNotifier {
  String buttonName = 'Continue';

  int currentStep = 0;
  Future<bool> nextStep({
    required StudentsController studentController,
    required StudentFormController studentFormController,
    required GlobalKey<FormState> formkeyFirstOne,
    required GlobalKey<FormState> formkeySecondOne,
  }) async {
    var firstFormValid = formkeyFirstOne.currentState?.validate() ?? false;

    if (firstFormValid && currentStep < 1) {
      formkeyFirstOne.currentState?.save();
      currentStep++;
      buttonName = 'Create';
      notifyListeners();
    } else {
      var secondFormValid = formkeySecondOne.currentState?.validate() ?? false;

      if (secondFormValid) {
        formkeySecondOne.currentState?.save();
        final StudentModel newStudent = studentFormController.createStudent();
        await studentController.create(student: newStudent);
        currentStep = 0;
        return true;
      }
    }
    return false;
  }

  List<StepForm> getSteps() => <StepForm>[
    StepForm.firstStep,
    StepForm.secondStep,
  ];
}
