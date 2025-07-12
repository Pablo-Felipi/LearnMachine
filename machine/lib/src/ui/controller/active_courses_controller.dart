import 'package:flutter/material.dart';
import 'package:machine/src/domain/models/active_courses/active_courses_model.dart';
import 'package:machine/src/interfaces/active_courses/interface_active_courses_repository.dart';

class ActiveCoursesController extends ChangeNotifier {
  final InterfaceActiveCoursesRepository repository;

  ActiveCoursesController({required this.repository});

  String isError = '';
  bool isLoading = false;
  List<ActiveCoursesModel> state =  [ ];

  Future<void> get() async {
    isLoading = true;
    notifyListeners();

    try {
      state = await repository.getCourses();
    } catch (e) {
      isError = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
