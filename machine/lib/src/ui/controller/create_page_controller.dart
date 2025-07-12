import 'package:flutter/material.dart';
import 'package:machine/src/domain/models/student/student_model.dart';
import 'package:machine/src/ui/controller/student_form_controller.dart';
import 'package:machine/src/ui/controller/students_controller.dart';

enum StepForm { firstStep, secondStep }

class CreatePageController extends ChangeNotifier {
  int currentStep = 0;
  void nextStep({
    required StudentsController studentController,
    required StudentFormController studentFormController,
  }) {
    if (currentStep < 1) {
      currentStep++;
      notifyListeners();
    } else {
      final StudentModel newStudent = studentFormController.createStudent();
      studentController.create(student: newStudent);
    }
  }

  List<StepForm> getSteps() => <StepForm>[
    StepForm.firstStep,
    StepForm.secondStep,
  ];
}
